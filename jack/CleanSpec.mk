# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# If you don't need to do a full clean build but would like to touch
# a file or delete some intermediate files, add a clean step to the end
# of the list.  These steps will only be run once, if they haven't been
# run before.
#
# E.g.:
#     $(call add-clean-step, touch -c external/sqlite/sqlite3.h)
#     $(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/STATIC_LIBRARIES/libz_intermediates)
#
# Always use "touch -c" and "rm -f" or "rm -rf" to gracefully deal with
# files that are missing or have been moved.
#
# Use $(PRODUCT_OUT) to get to the "out/target/product/blah/" directory.
# Use $(OUT_DIR) to refer to the "out" directory.
#
# If you need to re-do something that's already mentioned, just copy
# the command and add it to the bottom of the list.  E.g., if a change
# that you made last week required touching a file and a change you
# made today requires touching the same file, just copy the old
# touch step and add it to the end of the list.
#
# ************************************************
# NEWER CLEAN STEPS MUST BE AT THE END OF THE LIST
# ************************************************

# For example:
#$(call add-clean-step, rm -rf $(OUT_DIR)/target/common/obj/APPS/AndroidTests_intermediates)
#$(call add-clean-step, rm -rf $(OUT_DIR)/target/common/obj/JAVA_LIBRARIES/core_intermediates)
#$(call add-clean-step, find $(OUT_DIR) -type f -name "IGTalkSession*" -print0 | xargs -0 rm -f)
#$(call add-clean-step, rm -rf $(PRODUCT_OUT)/data/*)

$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/common)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/alsa_in_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/alsa_out_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/androidshmservice_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/shmservicetest_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/shmservicedump_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_samplerate_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_freewheel_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_connect_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_disconnect_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_latent_client_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_midiseq_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_zombie_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_lsp_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_load_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jackd_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_monitor_client_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_simple_looper_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_simple_client_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_cpu_load_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_iodelay_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_midisine_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_cpu_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_simple_keyboard_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_unload_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_wait_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_alias_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_metro_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_bufsize_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_thru_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_session_notify_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_midi_latency_test_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_rec_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_netsource_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_net_master_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_net_slave_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_showtime_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_server_control_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_evmon_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_test_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_transport_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_simple_session_client_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_simple_effect_intermediates)
$(call add_clean_step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_multiple_metro_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/EXECUTABLES/jack_midi_dump_intermediates)

$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/common)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/posix)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/libjack_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/libjacknet_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/libjackserver_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/libjackshm_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_alsa_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_dummy_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_net_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_loopback_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_netone_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/audioadapter_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/example_lib_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/netadapter_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/netmanager_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/profiler_intermediates)
$(call add-clean-step, rm -rf $(PRODUCT_OUT)/obj/SHARED_LIBRARIES/jack_goldfish_intermediates)

# ************************************************
# NEWER CLEAN STEPS MUST BE AT THE END OF THE LIST
# ************************************************
