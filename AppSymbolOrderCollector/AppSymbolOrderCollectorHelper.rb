#!/usr/bin/env ruby

def change_pods_target_config(installer)
    pods_project = installer.pods_project
    name = 'AppSymbolOrderCollector'

    order_collect_target = pods_project.targets.find { |t| t.name == name }
    if !order_collect_target.nil?
        all_pods_target_config(pods_project, name, order_collect_target)
    end
end

def all_pods_target_config(pods_project, name, order_collect_target)
    build_settings = Hash[
        'OTHER_CFLAGS' => '-fsanitize-coverage=func,trace-pc-guard',
        'OTHER_SWIFT_FLAGS' => '-sanitize=undefined -sanitize-coverage=func'
    ]

    isDynamic = order_collect_target.product_type.include?('framework')

    if isDynamic
        build_settings['FRAMEWORK_SEARCH_PATHS'] = '${PODS_CONFIGURATION_BUILD_DIR}/' + name
    end

    order_collect_reference = order_collect_target.product_reference

    pods_project.targets.each do |target|
        if target.name != name and !target.name.include?('Pods-')
            if isDynamic and !target.instance_of? Xcodeproj::Project::Object::PBXAggregateTarget
                build_phase = target.frameworks_build_phase
                if build_phase
                    build_phase.add_file_reference(order_collect_reference)
                end
            end

            target.build_configurations.each do |config|
                build_settings.each do |pair|
                    key = pair[0]
                    value = pair[1]
                    if config.build_settings[key].nil?
                        config.build_settings[key] = ['$(inherited)']
                    end
    
                    if !config.build_settings[key].include?(value)
                        config.build_settings[key] << value
                    end
                end
            end
            
            puts 'app_order_collect change ' + target.name + ' config success.'
        end
    end
end