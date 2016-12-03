
              <div class="login-content">
                  <div class="left">
                      <h2><?php echo $text_new_customer; ?></h2>
                      <p><?php echo $text_register_account; ?></p>
                      <div class="buttons">
                          <a id="button-account" class="button_medium"><?php echo $button_continue; ?></a>
                      </div>
                  </div>
                  <div class="right" id="login">
                      <h2><?php echo $text_returning_customer; ?></h2>
                      <p><?php echo $text_i_am_returning_customer; ?></p>
                      <div class="content_login">

                          <div><b><?php echo $entry_email; ?></b><input type="text" name="email" value="" /></div>

                          <div><b><?php echo $entry_password; ?></b><input type="password" name="password" value="" /> </div>

                          <div><b></b><a id="forgotten"><?php echo $text_forgotten; ?></a></div>

                          <div>
                              <b></b>
                              <input  id="button-login" type="button" value="<?php echo $button_login; ?>" class="button_medium button_right" onclick="$('#loading').show();" />
                          </div>
                        

                      </div>


                  </div>


              </div>
          


