<form method="post"
 action="MainConf.php?method=save">
 <table>
  <tr>
   <td><label for="TITLE">Title</label></td>
   <td><input type="text" name="TITLE" id="TITLE"
    value="<?php echo $GLOBALS['TEMPLATE']['Content']['MainConf']->TITLE;?>"/></td>
  </tr>
  <tr>
   <td><label for="PAGE_LOAD_INTERVAL">Page Load Interval</label></td>
   <td><input type="text" name="PAGE_LOAD_INTERVAL" id="PAGE_LOAD_INTERVAL"
    value="<?php echo $GLOBALS['TEMPLATE']['Content']['MainConf']->PAGE_LOAD_INTERVAL;?>"/></td>
  </tr>
  <tr>
   <td><label for="CACHE_SIZE">Cache Size</label></td>
   <td><input type="text" name="CACHE_SIZE" id="CACHE_SIZE"
    value="<?php echo $GLOBALS['TEMPLATE']['Content']['MainConf']->CACHE_SIZE;?>"/></td>
  </tr>
  <tr>
   <td><label for="ITEM_LIMIT">Item Limit</label></td>
   <td><input type="text" name="ITEM_LIMIT" id="ITEM_LIMIT"
    value="<?php echo $GLOBALS['TEMPLATE']['Content']['MainConf']->ITEM_LIMIT;?>"/></td>
  </tr>
  <tr>
   <td><label for="FLAG_PAUSE">Pause</label></td>
   <td>
    <select name="FLAG_PAUSE" id="FLAG_PAUSE">
     <option value="0" <?php if ($GLOBALS['TEMPLATE']['Content']['MainConf']->FLAG_PAUSE=="0") {echo 'selected="selected"';}?>>False</option>
     <option value="1" <?php if ($GLOBALS['TEMPLATE']['Content']['MainConf']->FLAG_PAUSE=="1") {echo 'selected="selected"';}?>>True</option>
   </select> 
  </tr>
   <td> </td>
   <td>
    <input type="submit" style="float: left;" value="Save"/>
    <div class="abuttonwrapper" style="float: right; width: auto;"><a href="index.php">Back</a></div>
   </td>
   <td><input type="hidden" name="submitted" value="1"/></td>
  </tr>
 </table>
</form>

