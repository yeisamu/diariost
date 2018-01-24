<?php defined('BASEPATH') OR exit('No direct script access allowed');
/* 
 *  ============================================================================== 
 *  Author	: Mian Saleem
 *  Email	: saleem@tecdiary.com 
 *  For		: PHPExcel
 *  Web		: https://mpdf1.com
 *  License	: GPL
 *		: http://www.opensource.org/licenses/gpl-license.php
 *  ============================================================================== 
 */
class Sma
{

    public function __construct()
    {

    }

    public function __get($var)
    {
        return get_instance()->$var;
    }
    public function generate_pdf($content, $name = 'download.pdf', $output_type = NULL, $footer = NULL, $margin_bottom = NULL, $header = NULL, $margin_top = NULL, $orientation = 'P')
    {
        if (!$output_type) {
            $output_type = 'D';
        }
        if (!$margin_bottom) {
            $margin_bottom = 10;
        }
        if (!$margin_top) {
            $margin_top = 10;
        }
        $this->load->library('pdf');
        $pdf = new mPDF('utf-8', 'A4-' . $orientation, '13', '', 10, 10, $margin_top, $margin_bottom, 9, 9);
        $pdf->debug = false;
        $pdf->autoScriptToLang = true;
        $pdf->autoLangToFont = true;
        $pdf->SetProtection(array('print')); // You pass 2nd arg for user password (open) and 3rd for owner password (edit)
        //$pdf->SetProtection(array('print', 'copy')); // Comment above line and uncomment this to allow copying of content
        // $pdf->SetTitle($this->Settings->site_name);
        // $pdf->SetAuthor($this->Settings->site_name);
        // $pdf->SetCreator($this->Settings->site_name);
        $pdf->SetDisplayMode('fullpage');
        $stylesheet = file_get_contents('css/admin1.css');
        $pdf->WriteHTML($stylesheet, 1);
        $stylesheet1 = file_get_contents('css/elements.css');
        $pdf->WriteHTML($stylesheet1, 1);
        $stylesheet2 = file_get_contents('plugins/bootstrap-table/dist/bootstrap-table.min.css');
        $pdf->WriteHTML($stylesheet2, 1);

        $pdf->WriteHTML($content);
        if ($header != '') {
            $pdf->SetHTMLHeader('<p class="text-center">' . $header . '</p>', '', TRUE);
        }
        if ($footer != '') {
            $pdf->SetHTMLFooter('<p class="text-center">' . $footer . '</p>', '', TRUE);
        }
        //$pdf->SetHeader($this->Settings->site_name.'||{PAGENO}', '', TRUE); // For simple text header
        //$pdf->SetFooter($this->Settings->site_name.'||{PAGENO}', '', TRUE); // For simple text footer
        if ($output_type == 'S') {
            $file_content = $pdf->Output('', 'S');
            write_file('assets/uploads/' . $name, $file_content);
            return 'assets/uploads/' . $name;
        } else {
            $pdf->Output($name, $output_type);
        }
    }
}