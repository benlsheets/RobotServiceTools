for robot_folder in *_BACKUP_*; do \
    for task_folder in $robot_folder/RAPID/TASK*; do \
        for prog_module in $task_folder/PROGMOD/*; do \
            git diff --no-index --quiet common_modules/$(basename "$prog_module") $prog_module && rm $prog_module; \
        done
        for sys_module in $task_folder/SYSMOD/*; do \
            git diff --no-index --quiet common_modules/$(basename "$sys_module") $sys_module && rm $sys_module; \
        done
    done

    mv $robot_folder/RAPID/TASK*/PROGMOD/* $robot_folder
    rm -rf $robot_folder/RAPID/TASK*/PROGMOD

    mv $robot_folder/RAPID/TASK1/SYSMOD/* $robot_folder
    rm -rf $robot_folder/RAPID/TASK1

    for task_folder in $robot_folder/RAPID/TASK*; do \
        for sys_module in $task_folder/SYSMOD/*; do \
            git diff --no-index --quiet $robot_folder/$(basename "$sys_module") $sys_module && rm $sys_module; \
        done
    done

    rm $robot_folder/system.xml; \
    rm -rf $robot_folder/BACKINFO; \
    rm -rf $robot_folder/CS; \
    rm -rf $robot_folder/HOME; \
    # rm -rf $robot_folder/RAPID; \
    mv $robot_folder ${robot_folder%%_BACKUP_*}; \
done
