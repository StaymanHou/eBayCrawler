<form method="post" action="query.php?method=downloadandmarkuse">
    <input type="submit" style="font-size: 30px;" value="Download & Mark Use"/>
    <input type="hidden" name="submitted" value="1"/>
    <table id="sellerinfotable">
        <thead>
            <tr>
                <td width="16px"><input type="checkbox" onClick="toggle(this)" checked="checked"/></td>
                <td>Seller Name</td>
                <td>Score</td>
                <td>Ave. Price</td>
                <td>Time Marker</td>
            </tr>
        </thead>
        <tbody>
            <?php
                $parityodd = false;
                foreach ($GLOBALS['TEMPLATE']['Content']['SellerDict'] as $pk => $info) {
                    $parityodd = $parityodd?false:true;
                    echo '<tr class="seller ';
                    echo $parityodd?'odd':'even';
                    echo '" pk="' . $pk . '"><td><input type="checkbox" name="pk_list[]" value="' . $pk . '" checked="checked"/></td><td>' . $GLOBALS['TEMPLATE']['Content']['SellerDict'][$pk]['username'] . '</td><td>' . $GLOBALS['TEMPLATE']['Content']['SellerDict'][$pk]['score'] . '</td><td>$' . $GLOBALS['TEMPLATE']['Content']['SellerDict'][$pk]['price'] . '</td><td>' . $GLOBALS['TEMPLATE']['Content']['SellerDict'][$pk]['used_time'] . '</td></tr>';
                    echo '<tr class="detail-' . $pk . '" style="display: none;"><td colspan="5"><ul style="padding-left: 25px">';
                    foreach ($GLOBALS['TEMPLATE']['Content']['SellerDict'][$pk]['category'] as $catone => $cattwodict) {
                        echo '<li><strong>' . $catone . '</strong></li>';
                        echo '<li><ul style="padding-left: 25px">';
                        foreach ($cattwodict as $cattwo => $quan) {
                            echo '<li>' . $cattwo . '(' . $quan . ')</li>';
                        }
                        echo '</ul></li>';
                    }
                    echo '</ul><td></tr>';
                }
            ?>
        </tbody>
    </table>
</form>

