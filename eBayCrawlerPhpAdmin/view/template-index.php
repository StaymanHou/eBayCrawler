<div style="float: right;">
    <a href="MainConf.php?method=get">Crawler Config</a>
</div>

<form method="post" action="query.php?method=search">
 <table>
  <tr>
   <td><label for="LIMIT"># LIMIT:</label></td>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="LIMIT" id="LIMIT"
    value="100"/>(<span style="font-size: 20px; color: red;">*</span>required; example: 100)</td>
  </tr>
  <tr>
   <td rowspan="2"><label for="SCORE">Score:</label></td>
   <td>>&nbsp;&nbsp;&nbsp;<input type="text" name="SCORE_LOW" id="SCORE_LOW"
    value=""/>(optional; example: 1)</td>
  </tr>
  <tr>
   <td><&nbsp;&nbsp;&nbsp;<input type="text" name="SCORE_HIGH" id="SCORE_HIGH"
    value=""/>(optional; example: 100)</td>
  </tr>
  <tr>
   <td rowspan="2"><label for="AVERAGE_PRICE">Average Price:</label></td>
   <td>>&nbsp;$<input type="text" name="AVERAGE_PRICE_LOW" id="AVERAGE_PRICE_LOW"
    value=""/>(optional; example: 1.23)</td>
  </tr>
  <tr>
   <td><&nbsp;$<input type="text" name="AVERAGE_PRICE_HIGH" id="AVERAGE_PRICE_HIGH"
    value=""/>(optional; example: 321)</td>
  </tr>
  <tr>
   <td><label for="CATONE">Category:</label></td>
   <td>
    <select name="CATONE" id="CATONE">
    <?php
        echo '<option value="--" selected="selected">--</option>';
        foreach ($GLOBALS['TEMPLATE']['Content']['CatOneList'] as $catone)
        {
            echo '<option value="' . $catone['PK'] . '">' . $catone['TITLE'] . '</option>';
        }
    ?>
    </select> 
   </td>
  </tr>
  <tr>
   <td><label for="CATTWO">Sub Category:</label></td>
   <td>
    <select name="CATTWO" id="CATTWO">
     <option value="--" selected="selected">--</option>
    </select> 
   </td>
  </tr>
  <tr>
   <td><label for="QUANTITY">Goods #:</label></td>
   <td>>&nbsp;&nbsp;&nbsp;<input type="text" name="QUANTITY" id="QUANTITY"
    value=""/>(optional; example: 1)</td>
  </tr>
  <tr>
   <td><label for="USED_TIME_FROM">Used Time From:</label></td>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="USED_TIME_FROM" id="USED_TIME_FROM"
    value=""/>(optional; example: 2013-06-30 12:00:00)</td>
  </tr>
  <tr>
   <td><label for="USED_TIME_TO">Used Time To:</label></td>
   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="USED_TIME_TO" id="USED_TIME_TO"
    value=""/>(optional; example: 2013-07-01 14:02:07)</td>
  </tr>
  <tr>
   <td colspan="2">(if you don't set both of the time then we will search for the sellers not used)</td>
  </tr>
  <tr>
   <td><label for="ORDER">Order:</label></td>
   <td>
    <select name="ORDER" id="ORDER">
     <option value="ASC" selected="selected">early first</option>
     <option value="DESC">late first</option>
    </select> 
   </td>
  </tr>
  <tr>
   <td> </td>
   <td>
    <input type="submit" style="float: left; font-size: 30px;" value="Search"/>
   </td>
   <td><input type="hidden" name="submitted" value="1"/></td>
  </tr>
 </table>
</form>

