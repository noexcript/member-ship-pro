<?php
   /**
    * _membership_grid
    *
    * @package Wojo Framework
    * @author wojoscripts.com
    * @copyright 2023
    * @version 5.00: _membership_grid.tpl.php, v1.00 7/5/2023 7:35 PM Gewa Exp $
    *
    */
   if (!defined('_WOJO')) {
      die('Direct access to this location is not allowed.');
   }
?>
<div class="row gutters justify-end">
   <div class="columns auto mobile-100 phone-100">
      <a href="<?php echo Url::url(Router::$path, 'new/'); ?>" class="wojo small secondary fluid button">
         <i class="icon plus alt"></i><?php echo Language::$word->MEM_SUB1; ?></a>
   </div>
</div>
<?php if (!$this->data): ?>
   <div class="center-align">
      <img src="<?php echo ADMINVIEW; ?>images/notfound.svg" alt="" class="wojo big inline image">
      <div class="margin-small-top">
         <p class="wojo small icon alert inverted attached compact message">
            <i class="icon exclamation triangle"></i>
            <?php echo Language::$word->MEM_NOMEM; ?></p>
      </div>
   </div>
<?php else: ?>
   <div class="wojo basic cards screen-3 tablet-3 mobile-1" id="sortable">
      <?php foreach ($this->data as $row): ?>
         <div class="card" id="item_<?php echo $row->id; ?>" data-id="<?php echo $row->id; ?>">
            <div class="content center-align">
               <div class="handle draggable">
                  <i class="icon grip horizontal"></i>
               </div>
               <?php if ($row->thumb): ?>
                  <img src="<?php echo UPLOADURL; ?>/memberships/<?php echo $row->thumb; ?>" alt="">
               <?php else: ?>
                  <img src="<?php echo UPLOADURL; ?>/memberships/default.svg" alt="">
               <?php endif; ?>
               <h5 class="margin-top"><?php echo Utility::formatMoney($row->price); ?>
                  <?php echo $row->title; ?></h5>
               <p class="wojo small text"><?php echo Validator::truncate($row->description, 40); ?></p>
               <a href="<?php echo Url::url(Router::$path, 'history/' . $row->id); ?>"
                  class="wojo small primary label"><?php echo $row->total; ?>
                  <?php echo Language::$word->TRX_SALES; ?></a>
            </div>
            <div class="footer">
               <div class="row small-horizontal-gutters justify-center">
                  <div class="columns auto">
                     <a href="<?php echo Url::url(Router::$path, 'edit/' . $row->id); ?>"
                        class="wojo icon inverted primary button">
                        <i class="icon pencil"></i>
                     </a>
                  </div>
                  <div class="columns auto">
                     <a data-set='{"option":[{"action": "trashMembership","title": "<?php echo Validator::sanitize($row->title, 'chars'); ?>","id": <?php echo $row->id; ?>}],"action":"trash","parent":"#item_<?php echo $row->id; ?>"}'
                        class="wojo icon inverted negative button data">
                        <i class="icon trash"></i>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      <?php endforeach; ?>
   </div>
   <script type="text/javascript" src="<?php echo SITEURL; ?>/assets/sortable.js"></script>
   <script type="text/javascript">
      // <![CDATA[
      $(document).ready(function () {
         $('#sortable').sortable({
            ghostClass: 'ghost',
            handle: '.handle',
            animation: 600,
            onUpdate: function () {
               let order = this.toArray();
               $.ajax({
                  type: 'post',
                  url: "<?php echo ADMINVIEW . '/helper.php';?>",
                  dataType: 'json',
                  data: {
                     iaction: 'sortMemberships',
                     sorting: order
                  }
               });
            }
         });
      });
      // ]]>
   </script>
<?php endif; ?>