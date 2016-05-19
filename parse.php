<?php
 libxml_use_internal_errors(true);

 $file = file_get_contents('./2.html', true);

 $DOM = new DOMDocument;
 $DOM->loadHTML($file);

 $tables = $DOM->getElementsByTagName('table');

 foreach ($tables as $table) {
         $tableId = $table->getAttribute('class');
         if (strcmp($tableId, 'fareList') == 0) {
            $rows = $table->getElementsByTagName('tr');
            foreach ($rows as $row) {
                    $columns = $row->getElementsByTagName('td');
                    foreach($columns as $column) {
                                     $fields = $column->getElementsByTagName('span');
                                     foreach ($fields as $field) {
                                             $type = $field->getAttribute('class');
                                             if (strcmp($type, 'legs') == 0) {
                                                print "TO: ".preg_replace('/\s+/', '-', trim($field->nodeValue))."\t";
                                                $prices = $row->getElementsByTagName('label');                 
                                                print "Normal: " . trim($prices->item(0)->nodeValue)." -- VClub: ".trim($prices->item(1)->nodeValue)."\n";
                                             }
                                             else if (strcmp($type, 'legs left-legs') == 0) {
                                                print "FROM: ".preg_replace('/\s+/', '-', trim($field->nodeValue))."\t";
                                             }
                                     }
                    }


            }
         }
         break;
 }

?>
