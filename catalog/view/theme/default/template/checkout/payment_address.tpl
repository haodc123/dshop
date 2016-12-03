<div>
     <p><?php echo $text_payment_note;?></p><br/>
    <select style="display: none;" name="payment_address_id" class="large-field-address" >
        <?php foreach ($addresses as $address) { ?>
        <?php if ($address['address_id'] == $payment_address_id) { ?>
        <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
        <?php } ?>
        <?php } ?>
    </select>
</div>
<div class="payment-content">
    <table class="form">
        <tr>
            <td><label><?php echo $entry_firstname; ?></label></td>
            <td><span class="large-field"><?php echo $payment_firstname; ?></span></td>
        </tr>
        <tr>
            <td> <label><?php echo $entry_lastname; ?></label></td>
            <td><span class="large-field"><?php echo $payment_lastname; ?></span></td>
        </tr>
        <tr>
            <td> <label><?php echo $entry_address_1; ?></label></td>
            <td><span class="large-field"><?php echo $payment_address_1; ?></span></td>
        </tr>
        <tr>
            <td><label><?php echo $entry_address_2; ?></label></td>
            <td><span class="large-field"><?php echo $payment_address_2; ?></span></td>
        </tr>
        <tr>
            <td><label><?php echo $entry_country; ?></label></td>
            <td><span class="large-field"><?php echo $payment_country;?></span>

            </td>
        </tr>
        <tr>
            <td><label><?php echo $entry_postcode; ?></label></td>
            <td><span class="large-field"><?php echo $payment_postcode; ?></span></td>
        </tr>
        <tr>
            <td><label><?php echo $entry_city; ?></label></td>
            <td><span class="large-field"><?php echo $payment_city; ?></span></td>
        </tr>

        <tr>
            <td><label><?php echo $entry_zone; ?></label></td>
            <td><span class="large-field"><?php echo $payment_zone; ?></span>

        </tr>
        <tr>
            <td><label><?php echo $entry_phone; ?></label></td>
            <td><span class="large-field"><?php echo $payment_telephone; ?></span></td>
        </tr>


    </table>
</div>

