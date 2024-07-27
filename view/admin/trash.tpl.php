<?php
   /**
    * trash
    *
    * @package Wojo Framework
    * @author wojoscripts.com
    * @copyright 2023
    * @version 5.00: trash.tpl.php, v1.00 7/11/2023 3:17 PM Gewa Exp $
    *
    */
   if (!defined('_WOJO')) {
      die('Direct access to this location is not allowed.');
   }

   App::Auth()->checkOwner();
?>
<div class="row gutters justify-end">
   <?php if ($this->data): ?>
      <div class="columns auto">
         <a data-set='{"option":[{"delete": "trashAll","title": "<?php echo Validator::sanitize(Language::$word->TRS_TEMPTY, 'chars'); ?>","id":0}],"action":"delete","parent":"#self","redirect":"<?php echo Url::url('/admin/trash'); ?>"}' class="wojo negative button data"><?php echo Language::$word->TRS_TEMPTY; ?></a>
      </div>
   <?php endif; ?>
</div>
<?php if (!$this->data): ?>
   <div class="center-align">
      <img src="<?php echo ADMINVIEW; ?>/images/notfound.svg" alt="" class="wojo huge inline image">
      <div class="margin-small-top">
         <p class="wojo small icon alert inverted attached compact message">
            <i class="icon exclamation triangle"></i><?php echo Language::$word->TRS_NOTRS; ?></p>
      </div>
   </div>
<?php else: ?>
   <?php foreach ($this->data as $type => $rows): ?>
      <?php switch ($type): ?>
<?php case 'user': ?>
            <div class="wojo simple segment margin-bottom">
               <table class="wojo small basic table">
                  <thead>
                  <tr>
                     <th colspan="2"><h6><?php echo Language::$word->ADM_USERS; ?></h6></th>
                  </tr>
                  </thead>
                  <?php foreach ($rows as $row): ?>
                     <?php $dataset = Utility::jSonToArray($row->dataset); ?>
                     <tr id="user_<?php echo $dataset->id; ?>">
                        <td><?php echo $dataset->fname; ?>
                           <?php echo $dataset->lname; ?></td>
                        <td class="auto">
                           <a data-set='{"option":[{"restore": "restoreUser","title": "<?php echo Validator::sanitize($dataset->fname . ' ' . $dataset->lname, 'chars'); ?>","id": "<?php echo $row->id; ?>", "type":"user"}],"action":"restore","subtext":"<?php echo Validator::sanitize(Language::$word->DELCONFIRM11,
                             'chars'); ?>", "parent":"#user_<?php echo $dataset->id; ?>"}' class="wojo mini positive button data">
                              <?php echo Language::$word->RESTORE; ?>
                           </a>
                           <a data-set='{"option":[{"delete": "deleteUser","title": "<?php echo Validator::sanitize($dataset->fname . ' ' . $dataset->lname, 'chars'); ?>","id": "<?php echo $row->id; ?>", "type":"user"}],"action":"delete", "parent":"#user_<?php echo $dataset->id; ?>"}' class="wojo mini negative button data">
                              <?php echo Language::$word->TRS_DELGOOD; ?>
                           </a>
                        </td>
                     </tr>
                  <?php endforeach; ?>
                  <?php unset($dataset); ?>
               </table>
            </div>
            <?php break; ?>

         <?php case 'membership': ?>
            <div class="wojo simple segment margin-bottom">
               <table class="wojo small basic table">
                  <thead>
                  <tr>
                     <th colspan="2"><h6><?php echo Language::$word->ADM_MEMBS; ?></h6></th>
                  </tr>
                  </thead>
                  <?php foreach ($rows as $row): ?>
                     <?php $dataset = Utility::jSonToArray($row->dataset); ?>
                     <tr id="membership_<?php echo $dataset->id; ?>">
                        <td><?php echo $dataset->title; ?></td>
                        <td class="auto">
                           <a data-set='{"option":[{"restore": "restoreMembership","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>", "type":"membership"}],"action":"restore","subtext":"<?php echo Validator::sanitize(Language::$word->DELCONFIRM11,
                             'chars'); ?>", "parent":"#membership_<?php echo $dataset->id; ?>"}' class="wojo mini positive button data">
                              <?php echo Language::$word->RESTORE; ?>
                           </a>
                           <a data-set='{"option":[{"delete": "deleteMembership","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"membership"}],"action":"delete", "parent":"#membership_<?php echo $dataset->id; ?>"}' class="wojo mini negative button data">
                              <?php echo Language::$word->TRS_DELGOOD; ?>
                           </a>
                        </td>
                     </tr>
                  <?php endforeach; ?>
                  <?php unset($dataset); ?>
               </table>
            </div>
            <?php break; ?>

         <?php case 'page': ?>
            <div class="wojo simple segment margin-bottom">
               <table class="wojo small basic table">
                  <thead>
                  <tr>
                     <th colspan="2"><h6><?php echo Language::$word->ADM_PAGES; ?></h6></th>
                  </tr>
                  </thead>
                  <?php foreach ($rows as $row): ?>
                     <?php $dataset = Utility::jSonToArray($row->dataset); ?>
                     <tr id="page_<?php echo $dataset->id; ?>">
                        <td><?php echo $dataset->title; ?></td>
                        <td class="auto">
                           <a data-set='{"option":[{"restore": "restorePage","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"page"}],"action":"restore","subtext":"<?php echo Validator::sanitize(Language::$word->DELCONFIRM11, 'chars'); ?>", "parent":"#page_<?php echo $dataset->id; ?>"}' class="wojo mini positive button data">
                              <?php echo Language::$word->RESTORE; ?>
                           </a>
                           <a data-set='{"option":[{"delete": "deletePage","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"page"}],"action":"delete", "parent":"#page_<?php echo $dataset->id; ?>"}' class="wojo mini negative button data">
                              <?php echo Language::$word->TRS_DELGOOD; ?>
                           </a>
                        </td>
                     </tr>
                  <?php endforeach; ?>
                  <?php unset($dataset); ?>
               </table>
            </div>
            <?php break; ?>

         <?php case 'coupon': ?>
            <div class="wojo simple segment margin-bottom">
               <table class="wojo small basic table">
                  <thead>
                  <tr>
                     <th colspan="2"><h6><?php echo Language::$word->ADM_COUPONS; ?></h6></th>
                  </tr>
                  </thead>
                  <?php foreach ($rows as $row): ?>
                     <?php $dataset = Utility::jSonToArray($row->dataset); ?>
                     <tr id="coupon_<?php echo $dataset->id; ?>">
                        <td><?php echo $dataset->title; ?></td>
                        <td class="auto">
                           <a data-set='{"option":[{"restore": "restoreCoupon","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"coupon"}],"action":"restore","subtext":"<?php echo Validator::sanitize(Language::$word->DELCONFIRM11, 'chars'); ?>", "parent":"#coupon_<?php echo $dataset->id; ?>"}' class="wojo mini positive button data">
                              <?php echo Language::$word->RESTORE; ?>
                           </a>
                           <a data-set='{"option":[{"delete": "deleteCoupon","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"coupon"}],"action":"delete", "parent":"#coupon_<?php echo $dataset->id; ?>"}' class="wojo mini negative button data">
                              <?php echo Language::$word->TRS_DELGOOD; ?>
                           </a>
                        </td>
                     </tr>
                  <?php endforeach; ?>
                  <?php unset($dataset); ?>
               </table>
            </div>
            <?php break; ?>

         <?php case 'news': ?>
            <div class="wojo simple segment margin-bottom">
               <table class="wojo small basic table">
                  <thead>
                  <tr>
                     <th colspan="2"><h6><?php echo Language::$word->ADM_NEWS; ?></h6></th>
                  </tr>
                  </thead>
                  <?php foreach ($rows as $row): ?>
                     <?php $dataset = Utility::jSonToArray($row->dataset); ?>
                     <tr id="coupon_<?php echo $dataset->id; ?>">
                        <td><?php echo $dataset->title; ?></td>
                        <td class="auto">
                           <a data-set='{"option":[{"restore": "restoreNews","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"coupon"}],"action":"restore","subtext":"<?php echo Validator::sanitize(Language::$word->DELCONFIRM11, 'chars'); ?>", "parent":"#coupon_<?php echo $dataset->id; ?>"}' class="wojo mini positive button data">
                              <?php echo Language::$word->RESTORE; ?>
                           </a>
                           <a data-set='{"option":[{"delete": "deleteNews","title": "<?php echo Validator::sanitize($dataset->title, 'chars'); ?>","id": "<?php echo $row->id; ?>","type":"coupon"}],"action":"delete", "parent":"#coupon_<?php echo $dataset->id; ?>"}' class="wojo mini negative button data">
                              <?php echo Language::$word->TRS_DELGOOD; ?>
                           </a>
                        </td>
                     </tr>
                  <?php endforeach; ?>
                  <?php unset($dataset); ?>
               </table>
            </div>
            <?php break; ?>

         <?php endswitch; ?>
   <?php endforeach; ?>
<?php endif; ?>

