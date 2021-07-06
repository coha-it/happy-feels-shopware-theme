{extends file="parent:frontend/index/footer.tpl"}

{* Footer menu *}
{block name='frontend_index_footer_menu'}
    <div class="footer--columns block-group">
        {include file='frontend/index/footer-navigation.tpl'}


	<div class="dnf-footer">
		<img src="https://das-neue-fuehren.de/wp-content/uploads/2021/02/email-logo-1.png" />
		<h4>Kongress 21. - 23. April 2021</h4>
		<a href="https://das-neue-fuehren.de/kongress/" target="_blank"><button class="btn btn-primary">Jetzt kostenfrei anmelden</button></a>
<p>
Was ist neu durch Corona, Krisenmodus und Homeoffice? Was wird sich langfristig durch die Krise verändern und wie können MitarbeiterInnen und Führungskräfte den Wandel gemeinsam erfolgreich gestalten? Wie sieht die Führung der Zukunft aus und wo ist ein Mindshift JETZT am dringendsten notwendig?
</p>

<p>
Erfahrene ExpertInnen aus Industrie, Wirtschaft und Forschung teilen ihr Wissen, wie wir die Herausforderungen der New Work jetzt meistern können. 
Jetzt kostenfrei anmelden und vom 21. bis 23. April dabei sein!
</p>
	</div>

        {* Coha Social Media *}
        <div class="coha--social-media-wrapper">
            <!-- YouTube -->
            <a class="social-media" href="https://www.youtube.com/channel/UCg2J2XXYc-ljwyyNci-SpMg" target="_blank">
                <div class="icon">
                    <i class="fab fa-youtube"></i>
                </div>
                <div class="text">YouTube</div>
            </a>
            <!-- Instagram -->
            <a class="social-media" href="https://instagram.com/corporate_happiness" target="_blank">
                <div class="icon">
                    <i class="fab fa-instagram"></i>
                </div>
                <div class="text">Instagram</div>
            </a>
            <!-- LinkedIN -->
            <a class="social-media" href="https://www.linkedin.com/company/corporate-happiness-gmbh" target="_blank">
                <div class="icon">
                    <i class="fab fa-linkedin-in"></i>
                </div>
                <div class="text">Linkedin</div>
            </a>

            <!-- XING -->
            <a class="social-media" href="https://www.xing.com/companies/corporatehappinessgmbh" target="_blank">
                <div class="icon">
                    <i class="fab fa-xing"></i>
                </div>
                <div class="text">Xing</div>
            </a>

            <!-- Twitter -->
            <a class="social-media" href="https://twitter.com/corphappiness" target="_blank">
                <div class="icon">
                    <i class="fab fa-twitter"></i>
                </div>
                <div class="text">Twitter</div>
            </a>

            <!-- Facebook -->
            <a class="social-media" href="https://www.facebook.com/CorporateHappiness/" target="_blank">
                <div class="icon">
                    <i class="fab fa-facebook-f"></i>
                </div>
                <div class="text">Facebook</div>
            </a>

            <!-- E-Mail -->
            <a class="social-media" href="/kontakt?c=18">
                <div class="icon shopware">
                    <i class="icon--mail"></i>
                </div>
                <div class="text">E-Mail</div>
            </a>

        </div>
    </div>
{/block}

{* Logo *}
{block name="frontend_index_shopware_footer_logo"}{/block}
