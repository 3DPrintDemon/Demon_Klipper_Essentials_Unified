# DEMON HOMING CONTROL SETTINGS 
Found in the demon_user_settings_v2.9.cfg onwards

`home_y_first` = set True to home the Y axis first or False to home X first. 

`override_home_power_safety` = leave this set False unless you need a high homing current. Damage may result if used improperly!

`home_power` = This is the power level to reduce the X Y axis down to while homing. Normally 0.6-0.7 is good

`pre_home_lift` = Set height to lift the toolhead prior to homing if axes are not enabled & homed. Range of 0-20mm

`z_lift_speed` = Set the speed to lift the Z axis. Range of 1-25mm/s - limited by your max_z_velocity

`axis_backoff_speed` = Set speed for the toolhead to back away from the axis endstop mm/s

`axis_backoff_distance` = Set distance in mm to back the toolhead away from the axis endstop

`axis_register_clear_wait` = Set axis register clear time. If using sensorless homing this value should be 2 seconds or slightly over

`homing_movement_travel_speed` = Set speed for the toolhead to move to the Z axis endstop or probing location in mm/s 

`set_probe_point_default` = Set False if you want a custom probing point for your bltouch/eddy probe

`set_probe_custom_x` = Set custom X probe position for your bltouch/eddy probe

`set_probe_custom_y` = Set custom Y probe position for your bltouch/eddy probe

`post_z_switch_backoff` = Set True to raise Z axis & back the gantry away from the rear of the printer after Z endstop switch press

`z_switch_backoff_y_dist` = Set how far to back the gantry away from the rear of the printer - not used if homing with probe

`post_z_switch_backoff_height` = Set safe Z height to park the toolhead after endstop switch press - not used if homing with probe

`z_endstop_location_x` = If you're using a separate non-Klicky Probe Z endstop switch of any sort set X axis location

`z_endstop_location_y` = If you're using a separate non-Klicky Probe Z endstop switch of any sort set Y axis location

### Head back to where you were...

****************************************************************************************************************************

If you feel these macros are valuable enough to download & use please consider hitting that "sponsor this project" button or the Ko-Fi image below or at https://ko-fi.com/3dprintdemon & buying me a beer/coffee. Its always very much appreciated & anything you do send goes towards helping me continue putting my ideas out there for the whole 3D printing community. Sending even a little makes a difference! Thank you & happy printing!!

[<img width="171" alt="kofi_s_tag_dark" src="https://github.com/3DPrintDemon/Demon_Klipper_Essentials_Unified/assets/122202359/08473899-563b-4b4d-9409-5e6602d6ec44">](https://ko-fi.com/3dprintdemon)
