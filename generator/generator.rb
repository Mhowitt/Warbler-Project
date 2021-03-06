require "faker"
require "date"
require "HTTParty"
require "json"
require "pry"

$profile_urls = []

for i in 0...100
  $profile_urls.push "https://randomuser.me/api/portraits/lego/#{i}.jpg" unless i > 9
  $profile_urls.push "https://randomuser.me/api/portraits/women/#{i}.jpg"
  $profile_urls.push "https://randomuser.me/api/portraits/men/#{i}.jpg"
end

$header_image_urls = []
for i in 1...100
  $header_image_urls.push(HTTParty.get("http://www.splashbase.co/api/v1/images/#{i}"))
end
$header_image_urls.map! { |response| response['url'] }

$num_users = 300
srand(DateTime.now.strftime('%Q').to_i)
$hipster = <<-HIPSTER
Selvage mustache pop-up man bun hexagon, tattooed gastropub four loko flannel lo-fi. Direct trade activated charcoal everyday carry, post-ironic pok pok keytar skateboard hammock live-edge organic flexitarian 90's lumbersexual. Put a bird on it humblebrag unicorn, twee occupy chicharrones whatever tousled etsy mustache you probably haven't heard of them. Taxidermy 90's lomo, kale chips sartorial chicharrones cliche poutine. Neutra viral poutine, fap XOXO four loko edison bulb VHS fingerstache man braid hot chicken selfies small batch kale chips chambray. Pug semiotics before they sold out, ugh bespoke bitters ramps authentic. Microdosing kombucha listicle, tbh schlitz celiac vape gastropub woke air plant.

Paleo disrupt neutra bushwick, street art aesthetic bespoke hammock ethical. Art party swag austin, street art forage master cleanse tacos chicharrones mixtape. Kogi sartorial enamel pin, kale chips artisan blog locavore skateboard. Biodiesel glossier succulents sustainable. Seitan roof party cardigan tousled mixtape chartreuse. Pour-over fingerstache affogato chillwave kogi intelligentsia, typewriter wayfarers truffaut woke. Asymmetrical waistcoat chartreuse mustache hammock offal.

Dreamcatcher flannel schlitz kombucha cold-pressed bushwick. Actually fanny pack try-hard polaroid, cliche offal gochujang poke vexillologist. Messenger bag church-key pok pok +1. Put a bird on it everyday carry pop-up hoodie brunch, normcore echo park small batch fam. Blog hexagon messenger bag, meggings trust fund single-origin coffee crucifix PBR&B keytar echo park humblebrag roof party migas letterpress. Meggings offal hashtag truffaut. Jean shorts venmo edison bulb lomo tattooed.

Heirloom hashtag succulents seitan, waistcoat cornhole vape everyday carry pop-up woke sustainable taxidermy fam occupy. Edison bulb master cleanse pork belly meggings aesthetic, hoodie venmo snackwave mixtape ugh shoreditch. Viral cliche live-edge mlkshk slow-carb. Gluten-free cold-pressed chillwave enamel pin, single-origin coffee schlitz four dollar toast tattooed pork belly street art kale chips kitsch trust fund vape semiotics. Austin hella jean shorts fap, blue bottle knausgaard whatever 3 wolf moon craft beer truffaut cronut portland mustache snackwave keffiyeh. Whatever seitan listicle four dollar toast, shoreditch neutra vice sriracha direct trade 3 wolf moon. Poutine pop-up jean shorts hot chicken, sriracha keffiyeh pug snackwave man braid polaroid affogato quinoa.

Roof party meggings la croix, fanny pack shabby chic knausgaard VHS neutra put a bird on it glossier microdosing asymmetrical. Marfa gluten-free pickled, coloring book succulents roof party cred XOXO mumblecore unicorn hammock. Shoreditch wolf cred plaid. Tousled single-origin coffee selvage chillwave crucifix, tacos paleo pug microdosing blue bottle hella occupy next level PBR&B. Vinyl affogato disrupt lo-fi, enamel pin mixtape four dollar toast hammock lomo fixie hexagon coloring book seitan. Irony sustainable sartorial post-ironic, wayfarers etsy blue bottle hashtag vape synth. Live-edge brooklyn tumblr banh mi, occupy neutra man braid squid 8-bit helvetica crucifix stumptown.

Shoreditch banh mi you probably haven't heard of them skateboard health goth, seitan twee DIY hashtag hella schlitz kitsch. Green juice aesthetic cold-pressed craft beer woke art party. Trust fund lumbersexual kitsch pabst. Cray kale chips disrupt blue bottle enamel pin vape venmo, iPhone hashtag selfies direct trade pok pok. DIY mlkshk 8-bit, glossier shoreditch XOXO kinfolk flexitarian scenester ethical swag wayfarers quinoa lomo. Pork belly mixtape migas narwhal retro. Meh chicharrones kinfolk, photo booth messenger bag yr copper mug wayfarers freegan.

Hot chicken franzen farm-to-table bicycle rights, stumptown selvage organic synth bespoke portland fingerstache photo booth mustache truffaut. Live-edge migas man braid pop-up, bespoke tumblr artisan health goth cliche. Before they sold out forage vaporware distillery prism viral lumbersexual, marfa man braid. Authentic meh lomo tattooed, pour-over pinterest unicorn glossier truffaut XOXO tacos. PBR&B microdosing bushwick irony. Ugh fam lumbersexual vinyl freegan bespoke, hot chicken craft beer subway tile. Pok pok tote bag cray squid master cleanse, fashion axe tumblr PBR&B ugh gastropub tbh helvetica food truck plaid.

Four loko deep v actually banh mi. Heirloom af affogato, ugh snackwave wayfarers typewriter master cleanse godard. Deep v try-hard prism scenester, chicharrones ramps succulents helvetica bitters pinterest four dollar toast twee iceland aesthetic schlitz. Thundercats banjo hashtag, man braid cornhole artisan lomo air plant. Retro air plant put a bird on it live-edge, fanny pack readymade gentrify chicharrones jean shorts cornhole. Fashion axe try-hard church-key ennui kinfolk XOXO, YOLO keytar hoodie. Venmo letterpress green juice, distillery slow-carb hammock kinfolk shabby chic.

Ramps master cleanse humblebrag chia. Hoodie la croix cornhole pabst street art. Offal whatever keffiyeh, tumblr kogi helvetica vape listicle flannel pabst austin 3 wolf moon biodiesel. Hoodie intelligentsia trust fund, photo booth jean shorts woke freegan fixie ramps pinterest everyday carry pug iPhone hella coloring book. Mixtape banjo vegan before they sold out brooklyn pickled four dollar toast ramps chambray, everyday carry YOLO. Helvetica literally tumeric semiotics. Readymade bushwick cold-pressed, typewriter cornhole cred vape kinfolk kickstarter kitsch gastropub heirloom polaroid migas.

Banh mi truffaut polaroid bitters lumbersexual, stumptown forage irony direct trade schlitz salvia. Lyft kickstarter umami, pinterest scenester shoreditch readymade single-origin coffee kombucha. Deep v actually fixie craft beer kitsch, typewriter thundercats ethical tumeric food truck gentrify gochujang chartreuse. Meggings blue bottle fixie subway tile, flexitarian brunch everyday carry. Cornhole banjo asymmetrical salvia, mustache kickstarter subway tile butcher. Man braid gastropub edison bulb, fanny pack shabby chic microdosing yr. Occupy marfa aesthetic, lo-fi single-origin coffee pop-up gochujang biodiesel photo booth yr +1.

Hashtag tumblr distillery normcore, edison bulb offal flannel truffaut typewriter gochujang. Craft beer ennui kickstarter mumblecore mixtape. Blue bottle swag tofu taxidermy. Mustache cray gentrify, franzen butcher artisan cliche wayfarers lyft hella hot chicken. Lomo austin keytar humblebrag, DIY jianbing vinyl godard cred poke. Taxidermy banjo fam, letterpress try-hard kinfolk 90's four dollar toast woke pug 8-bit. Squid godard cliche ugh portland gochujang, lumbersexual kombucha chartreuse single-origin coffee sartorial bitters kitsch.

VHS kombucha mlkshk, franzen mustache umami edison bulb blog. Snackwave single-origin coffee PBR&B enamel pin, kale chips four dollar toast forage next level unicorn poutine. Cold-pressed snackwave XOXO, fap master cleanse hexagon typewriter af trust fund tofu polaroid chillwave literally. Waistcoat swag drinking vinegar offal ugh raw denim. Aesthetic polaroid 3 wolf moon yuccie, flannel synth fixie green juice drinking vinegar poutine air plant blog. Ugh selvage roof party, lumbersexual enamel pin neutra etsy kale chips poke waistcoat tote bag normcore fanny pack bushwick. VHS celiac shoreditch yr, brunch vexillologist vinyl shabby chic farm-to-table salvia vegan small batch retro XOXO pug.

Hoodie master cleanse gastropub hot chicken, tofu green juice sriracha jean shorts pork belly YOLO. Air plant 90's ugh retro aesthetic edison bulb. Crucifix tacos flannel vice man braid. Flannel etsy subway tile craft beer taxidermy. Vape artisan bitters unicorn edison bulb pickled before they sold out. Shoreditch health goth master cleanse, scenester dreamcatcher cliche tattooed normcore freegan art party portland brooklyn slow-carb. Vaporware affogato butcher, tattooed poutine sustainable kombucha.

Tattooed cornhole viral keytar synth, lo-fi vexillologist echo park green juice deep v dreamcatcher single-origin coffee coloring book offal pug. Banjo ethical chia direct trade salvia, meh iceland gentrify fixie sustainable hexagon brooklyn yr scenester. Plaid kitsch tofu cray, chartreuse marfa venmo fixie heirloom bespoke skateboard. Trust fund heirloom listicle williamsburg venmo, seitan YOLO tousled. Shabby chic umami cliche, iceland copper mug messenger bag everyday carry you probably haven't heard of them. Kale chips direct trade echo park skateboard before they sold out brunch. Tumeric trust fund af, photo booth godard humblebrag cardigan affogato leggings woke celiac gentrify kogi gluten-free poutine.

Cray before they sold out distillery vice, keffiyeh gastropub keytar fashion axe viral tofu tote bag retro. Celiac blue bottle ramps hell of, pour-over blog cred tbh chartreuse hella. Messenger bag tbh typewriter cliche, lyft man braid helvetica af PBR&B street art salvia ethical everyday carry. Tbh schlitz irony cred direct trade you probably haven't heard of them crucifix, food truck vice banh mi DIY. Godard listicle next level ugh banjo letterpress roof party affogato, skateboard before they sold out edison bulb trust fund copper mug. Four loko health goth pork belly, umami fanny pack mixtape affogato fixie. Photo booth hashtag selfies kitsch kinfolk post-ironic crucifix, try-hard banh mi coloring book skateboard forage.

Truffaut selfies kickstarter pitchfork asymmetrical. Polaroid disrupt kickstarter, aesthetic marfa bicycle rights neutra lyft vice irony lumbersexual live-edge four dollar toast. Aesthetic man bun sriracha neutra everyday carry. Literally schlitz cliche gastropub, snackwave lomo ramps squid man braid. Ennui jianbing intelligentsia paleo vaporware try-hard. Woke hot chicken celiac whatever, hashtag neutra raclette tilde beard messenger bag vinyl schlitz locavore brunch succulents. +1 seitan raclette freegan lumbersexual crucifix.

Crucifix letterpress semiotics prism XOXO whatever. Stumptown cray put a bird on it health goth master cleanse vegan. Truffaut schlitz polaroid ethical tote bag. Twee post-ironic air plant bespoke, chia heirloom chartreuse gastropub gochujang hexagon vegan jianbing. Crucifix leggings heirloom, put a bird on it slow-carb authentic iceland forage vaporware lomo fixie craft beer YOLO. Aesthetic wolf lumbersexual, distillery four loko jean shorts farm-to-table photo booth neutra. Hammock godard VHS craft beer biodiesel, post-ironic franzen occupy retro.

Mixtape af meditation green juice, venmo organic fam helvetica stumptown copper mug master cleanse enamel pin coloring book. Vexillologist put a bird on it cronut yr literally, tbh photo booth pug retro letterpress post-ironic four loko. Church-key portland tumeric godard jianbing humblebrag. Keytar enamel pin cornhole, ennui schlitz small batch wolf. Letterpress leggings you probably haven't heard of them, retro ethical blog tilde fixie pok pok typewriter jean shorts. Iceland try-hard raclette dreamcatcher, flexitarian hashtag distillery tbh yuccie quinoa aesthetic microdosing leggings vexillologist. Ugh mustache brooklyn waistcoat enamel pin.

Bitters crucifix kombucha cold-pressed. Poutine skateboard tumblr, aesthetic organic banjo kale chips cardigan occupy listicle waistcoat yuccie seitan. Woke asymmetrical meh flexitarian. Health goth unicorn pickled farm-to-table trust fund blue bottle echo park intelligentsia. Brunch tattooed flannel authentic bushwick cornhole, direct trade wayfarers portland chia single-origin coffee thundercats tumeric keffiyeh. Freegan photo booth green juice narwhal lumbersexual. Knausgaard cronut brunch, asymmetrical offal whatever seitan pop-up XOXO truffaut scenester church-key salvia fam.

Jean shorts live-edge schlitz selvage brunch readymade. Waistcoat banjo locavore, neutra vape tbh chartreuse VHS. Actually etsy banh mi four loko, gochujang echo park yuccie. Bushwick forage pitchfork, roof party skateboard fixie lyft synth. Twee mlkshk vice, occupy umami vaporware food truck plaid. Portland kale chips selfies, fixie paleo coloring book snackwave sartorial single-origin coffee trust fund health goth cray air plant. Migas aesthetic selvage vape selfies.

Affogato disrupt vexillologist, vinyl yr cold-pressed artisan tilde plaid crucifix knausgaard. Pop-up hoodie photo booth, hella hashtag migas synth pitchfork jean shorts four dollar toast hell of. Gochujang fashion axe subway tile, deep v keytar YOLO pop-up drinking vinegar whatever tousled hoodie stumptown. Copper mug cardigan flannel organic 3 wolf moon. Before they sold out knausgaard stumptown kogi viral try-hard. Keytar pitchfork wolf glossier. Quinoa raclette polaroid post-ironic sustainable, pickled hoodie fanny pack.

Cred hoodie VHS, street art whatever meditation semiotics succulents schlitz. Gentrify wolf godard, fam williamsburg cardigan franzen craft beer celiac fixie disrupt copper mug flexitarian pok pok. 8-bit thundercats mixtape mlkshk. Dreamcatcher offal before they sold out, stumptown next level iPhone sustainable subway tile poke vaporware cold-pressed salvia crucifix. Succulents art party retro hashtag tilde mlkshk. Austin cred succulents, bicycle rights letterpress pabst actually mustache cold-pressed selvage pitchfork church-key ennui. Twee prism biodiesel freegan.

Brunch unicorn bushwick, four dollar toast hashtag glossier taxidermy fingerstache intelligentsia irony. Quinoa flannel locavore, lomo microdosing cronut church-key pug cornhole swag banh mi before they sold out. Typewriter swag beard whatever hexagon. Polaroid ennui stumptown chartreuse pug fashion axe. Affogato bicycle rights normcore humblebrag, distillery shoreditch listicle mumblecore tattooed. Ramps 3 wolf moon edison bulb health goth, woke mumblecore intelligentsia shoreditch fingerstache lyft swag pug succulents cardigan. Tilde pour-over cold-pressed, portland marfa tattooed fashion axe hexagon pop-up.

Activated charcoal waistcoat cred, celiac forage enamel pin twee hot chicken bicycle rights actually tbh master cleanse fanny pack retro etsy. Marfa cold-pressed gastropub, fanny pack pok pok salvia hell of brunch blue bottle. Actually edison bulb subway tile slow-carb blue bottle, tilde put a bird on it affogato man bun. Master cleanse chartreuse taxidermy coloring book, kombucha ennui whatever retro normcore bitters pabst prism synth. Semiotics franzen church-key flannel succulents tacos pop-up paleo, cronut selvage migas helvetica beard woke. Vinyl banjo small batch, flexitarian occupy man bun godard migas narwhal distillery meggings waistcoat blog neutra hammock. Microdosing street art brunch, lyft raclette neutra tousled organic shoreditch bitters.

Yr kickstarter wayfarers meh organic vaporware polaroid, waistcoat mixtape enamel pin trust fund. Thundercats subway tile 90's cornhole VHS, tote bag taxidermy tousled. La croix post-ironic listicle viral, fam air plant authentic stumptown green juice. Before they sold out pitchfork sustainable, prism XOXO hell of synth cray tacos. Whatever readymade lomo, shabby chic church-key man braid gluten-free semiotics flannel. Swag pinterest beard, pug selvage meditation put a bird on it master cleanse actually try-hard next level cray. Asymmetrical hashtag poke, viral swag before they sold out tumeric poutine heirloom mixtape vape PBR&B.

Vexillologist pour-over humblebrag, beard cornhole vice next level paleo direct trade ethical chambray. Vape vice heirloom meggings retro, fanny pack truffaut vaporware lyft artisan 3 wolf moon leggings glossier. Blog af try-hard freegan. Brooklyn coloring book mlkshk, lo-fi live-edge VHS cornhole food truck blue bottle cred viral ethical. Blog brooklyn shabby chic pour-over, flannel tumblr ennui kickstarter hella tofu fap literally taxidermy. Hashtag kickstarter gluten-free, stumptown banjo fingerstache mixtape coloring book iPhone farm-to-table edison bulb mlkshk. Fashion axe salvia try-hard humblebrag, tumeric authentic before they sold out.

Edison bulb 3 wolf moon hoodie, leggings VHS mumblecore cold-pressed kickstarter drinking vinegar jean shorts sriracha kinfolk poke tbh health goth. Single-origin coffee portland pork belly flexitarian schlitz, chicharrones man braid you probably haven't heard of them. Kogi flexitarian vice, cliche air plant occupy kinfolk beard. Brunch lumbersexual PBR&B, messenger bag selvage kickstarter vinyl air plant godard man braid kogi. Cold-pressed mustache jean shorts, craft beer green juice stumptown thundercats twee paleo vinyl. Raclette food truck chicharrones bushwick, poutine tilde vinyl copper mug farm-to-table. Meh portland YOLO, wayfarers health goth wolf tacos marfa pug tattooed schlitz hoodie narwhal migas.

Microdosing succulents vinyl fanny pack, pickled single-origin coffee chia hexagon butcher cornhole wolf green juice disrupt thundercats plaid. Drinking vinegar semiotics tumblr, lomo poke tbh man bun vape pinterest craft beer retro. Everyday carry raclette offal art party, locavore woke plaid cray. Readymade portland kitsch, keytar cold-pressed polaroid butcher thundercats farm-to-table. Waistcoat brooklyn normcore before they sold out neutra, sriracha shabby chic chillwave small batch iceland ramps food truck tofu crucifix. Banh mi mlkshk health goth before they sold out flexitarian. Activated charcoal tofu mumblecore sriracha fam.

Shabby chic vaporware put a bird on it mustache. Hashtag leggings keffiyeh 8-bit fashion axe squid, next level prism fap tacos. Bitters ethical four dollar toast, everyday carry mumblecore church-key vaporware asymmetrical 3 wolf moon. Snackwave literally thundercats roof party tumeric food truck, cronut ethical kogi cornhole retro vegan pop-up glossier jean shorts. Tumeric beard live-edge, blue bottle food truck butcher marfa sustainable. Meh forage asymmetrical organic. La croix gluten-free activated charcoal tilde art party schlitz, etsy irony green juice.

Banh mi heirloom occupy poutine. Tofu aesthetic hashtag hot chicken seitan, meggings bushwick kombucha sustainable listicle bitters ethical YOLO. Pug cliche vaporware schlitz wayfarers. Flexitarian bitters humblebrag disrupt. Shoreditch everyday carry schlitz, wayfarers ethical irony hashtag marfa vexillologist echo park knausgaard chambray scenester 3 wolf moon. Paleo truffaut artisan, mlkshk ethical scenester live-edge etsy pabst. Flexitarian everyday carry kogi, flannel hashtag salvia keytar hoodie.

Ennui gentrify poke brooklyn snackwave. Echo park tilde typewriter, dreamcatcher franzen farm-to-table leggings lyft. Raw denim fixie church-key vape, ennui brunch snackwave pug tumblr narwhal authentic selvage humblebrag synth. Four loko XOXO chia cray, DIY try-hard PBR&B small batch. Unicorn subway tile yuccie 3 wolf moon four dollar toast bitters, tote bag church-key vape +1 biodiesel live-edge jianbing. Schlitz pour-over unicorn occupy, mustache meggings mumblecore celiac blue bottle disrupt cardigan helvetica fixie. Cornhole af vegan mlkshk, typewriter migas beard tofu.

Gluten-free cornhole skateboard cold-pressed helvetica tumblr. Irony cliche PBR&B hot chicken, yuccie vexillologist tacos venmo. Banh mi photo booth venmo tousled la croix. Helvetica tousled yr readymade marfa. Try-hard offal semiotics marfa, prism iPhone jianbing forage hot chicken. Vinyl vexillologist kinfolk jean shorts umami, trust fund hexagon. Brunch viral fam, shabby chic distillery cornhole tumblr listicle waistcoat literally.

Crucifix scenester cornhole vape yr food truck. Tote bag neutra jianbing locavore actually, roof party helvetica lo-fi pickled. Prism lumbersexual knausgaard post-ironic hammock thundercats, pitchfork selvage heirloom. Flannel pinterest chillwave, narwhal VHS ramps try-hard lumbersexual yr vape pitchfork mustache chicharrones jianbing. Schlitz pok pok swag, XOXO fam bushwick hoodie mixtape cardigan affogato. Affogato banh mi PBR&B irony try-hard, kickstarter health goth butcher. Man bun fixie mixtape, jean shorts hammock tbh squid vexillologist prism wolf knausgaard vegan williamsburg mustache.

Drinking vinegar bespoke selfies sustainable jianbing master cleanse fashion axe, ennui heirloom humblebrag. Williamsburg tote bag XOXO, man braid aesthetic butcher offal sustainable echo park bespoke pitchfork squid. Vape tattooed organic mixtape, tote bag fap locavore keffiyeh microdosing. Pop-up swag banh mi DIY semiotics chambray. Woke bitters tacos synth. Iceland blog street art kinfolk everyday carry humblebrag taxidermy. Gochujang hella distillery DIY art party, knausgaard vexillologist readymade edison bulb squid gastropub mlkshk copper mug asymmetrical pour-over.

Authentic kale chips kinfolk, air plant iceland man bun scenester you probably haven't heard of them venmo leggings mustache. Subway tile aesthetic fanny pack drinking vinegar, bespoke offal tbh sustainable gluten-free. Portland hammock master cleanse cred, hot chicken fap cornhole photo booth pour-over before they sold out beard. Drinking vinegar kale chips plaid, pug cray chartreuse quinoa chia brunch shabby chic brooklyn jianbing man bun tote bag. Distillery jean shorts vinyl, skateboard fam yuccie taxidermy tilde heirloom brooklyn crucifix la croix lumbersexual bushwick photo booth. Woke four loko copper mug, keytar before they sold out kitsch pork belly street art. Readymade butcher church-key food truck.

Af deep v venmo la croix sartorial messenger bag. Meggings cold-pressed viral, fam coloring book chambray activated charcoal bitters woke succulents truffaut. Ramps stumptown hashtag, disrupt affogato gentrify subway tile celiac squid helvetica readymade bespoke farm-to-table gastropub meditation. Mlkshk blog yuccie, mixtape ugh activated charcoal coloring book. +1 paleo hot chicken yr portland la croix, you probably haven't heard of them chartreuse chillwave flexitarian biodiesel roof party disrupt cardigan. Paleo small batch 90's, fixie skateboard live-edge 3 wolf moon. Helvetica 3 wolf moon ugh mustache tattooed, lomo synth sriracha.

Etsy meggings pickled poke, disrupt shoreditch whatever you probably haven't heard of them synth heirloom air plant flannel pour-over slow-carb. Chambray poutine pinterest leggings cronut. Sartorial 3 wolf moon man bun meggings tote bag, fingerstache hot chicken hashtag. Tbh seitan semiotics iPhone, sriracha selvage jean shorts la croix tousled post-ironic beard chicharrones literally vegan fingerstache. Mlkshk narwhal green juice, distillery gentrify authentic aesthetic keffiyeh kitsch intelligentsia tote bag church-key migas schlitz vexillologist. Tote bag disrupt tacos swag kinfolk biodiesel. Hella banjo narwhal, drinking vinegar trust fund mlkshk lyft.

Tbh salvia health goth gentrify craft beer fixie. Williamsburg distillery knausgaard flannel. Lyft drinking vinegar hell of mixtape flexitarian. Woke mustache synth, plaid bitters fixie kombucha 90's keytar pour-over cold-pressed. Put a bird on it fixie chambray, fingerstache tumeric disrupt letterpress quinoa. Activated charcoal seitan chambray, synth bicycle rights blog locavore. Meh everyday carry tofu drinking vinegar, ethical kickstarter taxidermy semiotics selvage.

Squid kale chips post-ironic viral. Kitsch farm-to-table pour-over locavore fingerstache, ugh cray slow-carb four dollar toast kale chips cronut. Keffiyeh quinoa four loko, fashion axe farm-to-table umami affogato crucifix typewriter meggings vexillologist unicorn meh lomo knausgaard. Pinterest man braid chicharrones cray cardigan trust fund. Sustainable echo park heirloom kale chips shabby chic godard. Edison bulb bespoke cardigan DIY. Celiac four loko affogato franzen, austin swag stumptown marfa.

Mixtape etsy iPhone activated charcoal authentic snackwave lomo. Snackwave pickled scenester disrupt stumptown synth. Sustainable food truck tousled, venmo cred occupy XOXO wolf church-key DIY. 90's 8-bit ennui taxidermy, truffaut iceland forage XOXO austin affogato art party vinyl pitchfork kinfolk tumblr. Yuccie vexillologist venmo, occupy chambray narwhal meggings listicle snackwave retro. Jean shorts normcore knausgaard franzen, cred bushwick kinfolk aesthetic ramps. Pickled disrupt 90's, microdosing mustache bicycle rights pop-up pour-over hella raw denim gastropub.

Tilde raclette iceland literally bitters. Banjo ethical bitters squid lo-fi, distillery trust fund polaroid semiotics austin meh la croix truffaut craft beer. Aesthetic woke roof party pok pok marfa. DIY coloring book pok pok wayfarers art party, lomo marfa. Neutra vaporware 8-bit, crucifix XOXO paleo chillwave mlkshk bitters. Snackwave occupy wolf craft beer XOXO, deep v PBR&B you probably haven't heard of them meh fap. Chillwave four dollar toast skateboard, bitters marfa hella selfies meh waistcoat blue bottle pickled swag.

8-bit sriracha hashtag, direct trade XOXO slow-carb meggings bicycle rights prism chartreuse organic health goth microdosing. Pour-over art party bitters, edison bulb listicle seitan heirloom brooklyn venmo neutra fanny pack biodiesel flexitarian. Next level succulents wayfarers, crucifix brunch heirloom small batch bushwick. Meh hammock hella, tumblr helvetica prism gochujang man bun deep v echo park DIY keffiyeh etsy franzen iPhone. Butcher normcore pickled chia. Lumbersexual mumblecore put a bird on it green juice bespoke. Cardigan try-hard +1 disrupt forage.

Fam glossier ramps cornhole, everyday carry shoreditch stumptown tumblr organic offal air plant tumeric. Etsy XOXO squid, williamsburg freegan messenger bag shabby chic cold-pressed swag ethical chicharrones paleo tote bag pork belly direct trade. Art party woke keytar ugh green juice, cray vape offal tattooed. Ennui keffiyeh taxidermy snackwave bicycle rights. Wolf vice freegan, air plant edison bulb lo-fi pitchfork swag taxidermy. Put a bird on it occupy brooklyn YOLO narwhal. Iceland tumblr affogato, tumeric glossier occupy stumptown before they sold out selfies jianbing raclette.

Thundercats pork belly pop-up asymmetrical shoreditch roof party. Semiotics wayfarers chartreuse, yuccie vape fingerstache humblebrag gluten-free direct trade blog dreamcatcher biodiesel helvetica VHS meh. Hexagon paleo ramps sriracha, lumbersexual helvetica typewriter four loko. Sustainable viral pour-over, gluten-free irony prism bitters semiotics biodiesel hoodie. Farm-to-table hell of subway tile, vexillologist beard chambray intelligentsia kogi typewriter bushwick irony offal venmo. Gastropub raclette +1 prism. Celiac helvetica listicle literally direct trade.

Hella intelligentsia XOXO, af portland literally cred dreamcatcher. Leggings selvage pour-over subway tile taxidermy. Artisan post-ironic williamsburg iPhone. Kinfolk PBR&B tbh air plant, aesthetic shoreditch lyft meh everyday carry cronut freegan distillery cray. Sriracha polaroid ugh, pop-up four loko food truck 90's. Activated charcoal air plant direct trade austin, chartreuse asymmetrical seitan cold-pressed. Chia fam kitsch brooklyn activated charcoal, retro gochujang bespoke truffaut farm-to-table PBR&B.

Everyday carry pickled skateboard live-edge ethical, shoreditch blog microdosing ramps semiotics 8-bit crucifix try-hard. Fanny pack put a bird on it photo booth, synth hashtag vice cold-pressed cronut organic meh af chartreuse affogato enamel pin shoreditch. Readymade waistcoat lomo pok pok chia. Subway tile gochujang you probably haven't heard of them, shoreditch everyday carry typewriter semiotics tilde leggings. Put a bird on it narwhal master cleanse, everyday carry pug offal wayfarers bespoke forage freegan flannel. Bicycle rights flannel hashtag chambray irony crucifix. Marfa cronut beard, gentrify PBR&B meh pitchfork blue bottle next level tousled cray skateboard woke.

Williamsburg vaporware +1 bespoke bicycle rights thundercats. Banjo 3 wolf moon kogi celiac polaroid. Hammock crucifix VHS hella letterpress dreamcatcher. Lomo banjo kogi migas four dollar toast etsy, sustainable tilde chambray XOXO ugh unicorn. Bushwick DIY yr schlitz, typewriter heirloom marfa succulents. Health goth tbh gluten-free, blue bottle brooklyn unicorn photo booth farm-to-table butcher fap vice williamsburg. Poke meditation air plant enamel pin polaroid asymmetrical, tacos kogi pok pok gluten-free pop-up stumptown keytar distillery.

Mumblecore VHS distillery before they sold out, enamel pin gochujang aesthetic bitters chartreuse. Shoreditch sartorial authentic, fixie raw denim fanny pack tbh ugh venmo crucifix typewriter farm-to-table meh cold-pressed. Blog subway tile 3 wolf moon 8-bit austin iceland. VHS occupy stumptown disrupt forage chia. Hoodie bitters blog, austin pour-over subway tile typewriter tattooed VHS roof party drinking vinegar. Tousled cliche chia iceland skateboard, kitsch crucifix post-ironic polaroid fam swag. Selfies banh mi cray, brooklyn quinoa artisan seitan.

Hell of fanny pack gentrify activated charcoal cold-pressed synth readymade, truffaut XOXO. Four loko yr intelligentsia, pitchfork tote bag skateboard air plant austin neutra viral raw denim street art mustache glossier cliche. Vape sartorial cray edison bulb readymade roof party blog occupy. Roof party sriracha messenger bag before they sold out sustainable, taxidermy fam mumblecore slow-carb meggings humblebrag crucifix. Glossier craft beer chia, synth gochujang blog tattooed artisan you probably haven't heard of them. Semiotics coloring book austin freegan. 8-bit vice meditation, microdosing fixie you probably haven't heard of them cornhole hashtag poke ethical semiotics lomo sriracha +1.

Vegan literally mustache umami quinoa, kale chips roof party lo-fi banjo gochujang iPhone butcher hashtag marfa PBR&B. Forage celiac brunch squid. Chillwave microdosing kickstarter four loko yr quinoa. Gluten-free pour-over bespoke austin sustainable, cliche forage organic. Cred jean shorts copper mug try-hard, vinyl pour-over tote bag lyft vexillologist ennui edison bulb DIY. Fixie hashtag glossier farm-to-table mumblecore, echo park roof party taxidermy freegan. Master cleanse mustache activated charcoal pug enamel pin squid echo park, fashion axe kale chips iceland poke copper mug.

Twee next level subway tile, street art irony pickled thundercats mixtape typewriter. Tote bag everyday carry swag, ramps la croix waistcoat normcore raw denim. Hoodie deep v woke, jianbing subway tile plaid small batch messenger bag drinking vinegar chia 90's ennui. Chia venmo fap yuccie fingerstache four dollar toast. Messenger bag affogato bushwick tbh stumptown, health goth literally listicle. Beard activated charcoal kinfolk squid tattooed. +1 keffiyeh master cleanse, deep v artisan art party venmo raclette fashion axe humblebrag put a bird on it fam.

Cred messenger bag tbh, pork belly everyday carry iPhone seitan ramps yr meggings. Portland blog tbh, DIY banh mi kale chips craft beer austin marfa vinyl jianbing cray. Jianbing chicharrones humblebrag, occupy put a bird on it poutine four dollar toast cred portland sustainable cornhole sartorial beard. Microdosing blog try-hard authentic synth af. Authentic affogato hella truffaut literally, VHS craft beer knausgaard vice pinterest tote bag wolf. Glossier photo booth scenester tbh. VHS put a bird on it pickled cray hoodie.

Poke affogato hell of, gochujang gastropub seitan you probably haven't heard of them pinterest farm-to-table. Health goth four dollar toast thundercats kogi, listicle blue bottle quinoa +1 yr williamsburg dreamcatcher direct trade synth. Chia hell of hot chicken vegan blog. Organic mustache activated charcoal synth, skateboard tote bag kitsch prism aesthetic enamel pin taxidermy kinfolk. Post-ironic migas raclette tofu bespoke. Raw denim pug cronut fam, snackwave heirloom slow-carb subway tile drinking vinegar cardigan chartreuse squid blue bottle echo park. Plaid YOLO copper mug, tousled coloring book vape tbh craft beer street art portland letterpress distillery chicharrones.

Pop-up poutine succulents, selvage +1 vape post-ironic. Hella blue bottle 3 wolf moon tote bag 8-bit. Authentic helvetica you probably haven't heard of them lo-fi wolf, vape man bun lumbersexual godard tbh viral snackwave wayfarers. Cornhole kinfolk asymmetrical, leggings butcher selfies listicle pour-over hoodie raw denim fap trust fund. Keytar succulents tilde offal, scenester meggings artisan echo park. Wayfarers kale chips aesthetic, viral polaroid coloring book waistcoat ennui listicle gastropub franzen. Hot chicken portland brunch unicorn, prism sustainable deep v readymade artisan twee flannel fingerstache.

Celiac occupy offal godard, vinyl +1 VHS locavore paleo. Tote bag af distillery affogato, vice pickled intelligentsia cred schlitz raw denim yuccie iceland readymade quinoa live-edge. Lyft normcore iceland, synth health goth banjo flannel. Tattooed synth fixie, tote bag godard austin microdosing etsy. Hexagon tousled iceland, succulents locavore cornhole hoodie health goth tilde small batch tumblr sriracha. Semiotics blue bottle biodiesel, street art migas sartorial pok pok bicycle rights bespoke subway tile activated charcoal. Flannel kale chips yr wayfarers.

Authentic yr wayfarers, sriracha mustache scenester slow-carb semiotics offal af tumblr DIY. Locavore letterpress schlitz fap bitters asymmetrical marfa man bun flannel, cliche fingerstache umami 8-bit poke tote bag. Flannel umami venmo edison bulb, migas letterpress man bun williamsburg kinfolk pok pok mustache hella fixie meditation ethical. Vaporware locavore kale chips hell of subway tile, humblebrag shabby chic vice chartreuse narwhal biodiesel chambray bushwick butcher. Aesthetic single-origin coffee shoreditch, celiac crucifix viral chambray prism intelligentsia tattooed farm-to-table kitsch. Synth flannel godard skateboard small batch dreamcatcher four loko af literally messenger bag listicle, before they sold out roof party. Vaporware master cleanse scenester, pabst subway tile jean shorts photo booth jianbing shoreditch hashtag neutra brunch.

Chartreuse church-key jean shorts la croix chicharrones, brooklyn kitsch raclette retro XOXO normcore kickstarter cronut. Lo-fi pickled succulents, YOLO la croix ethical knausgaard hell of bitters disrupt meh snackwave 90's. Health goth fap tofu, pabst roof party street art tumblr. Health goth pug semiotics hexagon cliche butcher. Tilde glossier bitters intelligentsia. Pok pok etsy craft beer live-edge, cliche blue bottle kickstarter coloring book drinking vinegar kogi small batch typewriter biodiesel forage tattooed. Fashion axe listicle cornhole tattooed distillery.

Art party ramps gluten-free narwhal lo-fi. Truffaut tilde shabby chic aesthetic meh selfies typewriter, woke poke biodiesel. Succulents kogi helvetica deep v synth. Hammock kale chips health goth, crucifix blog chillwave kitsch venmo chambray four dollar toast bicycle rights cliche. Fingerstache tumeric lyft, sriracha distillery keytar yuccie poutine mlkshk marfa. Pickled four dollar toast snackwave jianbing bespoke street art. Vaporware health goth biodiesel flexitarian.

Keytar air plant authentic small batch beard. Iceland vaporware williamsburg edison bulb banjo hammock. Taxidermy marfa keytar, sustainable bushwick XOXO lo-fi. Brunch gentrify viral tousled thundercats normcore austin actually, roof party leggings. Slow-carb bitters truffaut godard bushwick quinoa. Dreamcatcher shabby chic tbh vape, wayfarers venmo deep v sriracha hot chicken. Banjo synth chillwave, twee four dollar toast deep v kickstarter.

Live-edge yuccie lomo heirloom. Artisan tilde literally, affogato knausgaard XOXO whatever enamel pin fanny pack viral. Copper mug next level keytar, truffaut godard mumblecore ugh. Pug brooklyn godard tumeric yr meditation. Paleo pitchfork distillery kitsch tousled disrupt squid, gochujang XOXO salvia marfa. Literally hot chicken letterpress la croix jean shorts. Echo park butcher raw denim, blog hexagon photo booth 8-bit etsy swag.

Raw denim dreamcatcher chicharrones gochujang sustainable. Chillwave slow-carb shabby chic irony, authentic street art af ennui. Synth bicycle rights 3 wolf moon, retro raw denim tbh unicorn trust fund truffaut craft beer plaid put a bird on it. Church-key sustainable knausgaard keffiyeh. Normcore knausgaard gastropub listicle authentic bushwick. 90's retro biodiesel coloring book, pour-over marfa mumblecore chambray meggings. Helvetica tote bag mixtape street art, 90's church-key cred paleo everyday carry echo park jianbing kitsch crucifix pabst coloring book.

Retro chia waistcoat, vegan locavore asymmetrical single-origin coffee pinterest portland vaporware echo park mustache. Edison bulb tbh tote bag 8-bit helvetica venmo, live-edge kale chips iceland jean shorts. Polaroid literally raclette knausgaard. Try-hard lomo microdosing scenester venmo, pickled heirloom offal. Green juice master cleanse iceland, farm-to-table man braid chillwave narwhal mustache deep v. Vexillologist wolf enamel pin irony vinyl tbh raclette glossier. Church-key man braid chartreuse cardigan mixtape.

Helvetica kickstarter tattooed succulents poke, cardigan brooklyn photo booth hexagon lo-fi hell of messenger bag kitsch. Fixie small batch heirloom sriracha hoodie. Hammock cred humblebrag, next level listicle truffaut gastropub aesthetic hella squid deep v. Leggings pour-over williamsburg, synth listicle intelligentsia dreamcatcher iPhone iceland pitchfork. Echo park deep v iceland pug PBR&B cliche venmo butcher. Next level banh mi gluten-free aesthetic, cronut hammock offal try-hard synth lomo kogi literally tousled. Cold-pressed gentrify gochujang etsy, meggings copper mug vape edison bulb disrupt hella fixie marfa.

Dreamcatcher yr organic salvia vape actually, schlitz fap. Kogi humblebrag fashion axe shabby chic, polaroid slow-carb DIY pinterest. Everyday carry fam chia fingerstache. Mixtape selfies 90's, lo-fi cred you probably haven't heard of them pok pok yuccie fingerstache. Church-key gastropub banh mi marfa, fanny pack mustache locavore tacos art party. Roof party beard 90's, prism franzen mustache trust fund affogato irony snackwave flannel mlkshk yuccie. Gentrify twee plaid, keytar meh chicharrones beard hoodie ethical ramps XOXO bicycle rights cornhole.

Readymade brooklyn keffiyeh authentic godard scenester. Sriracha chillwave neutra, taxidermy hashtag jianbing irony iPhone master cleanse. Pitchfork chicharrones kale chips, put a bird on it lyft sustainable squid green juice. Chicharrones unicorn authentic pok pok cronut, portland cardigan plaid bushwick echo park gluten-free. Godard cronut venmo beard, sustainable four loko hella. Umami skateboard locavore mustache copper mug. Subway tile brooklyn iceland banjo, YOLO green juice irony humblebrag you probably haven't heard of them bitters scenester skateboard gentrify.

Williamsburg everyday carry cronut offal street art air plant. Ugh whatever unicorn poke sriracha cronut. DIY man braid williamsburg, air plant swag tumeric jianbing asymmetrical twee VHS marfa fam tumblr pug. XOXO fam food truck vinyl, hammock cliche blog deep v aesthetic cray vegan. Man braid iceland affogato, aesthetic lyft readymade migas unicorn crucifix next level. Iceland before they sold out mlkshk deep v biodiesel paleo. Trust fund actually subway tile, sriracha iPhone freegan next level small batch squid pour-over farm-to-table waistcoat cray normcore microdosing.

Cornhole humblebrag artisan, XOXO aesthetic plaid hell of next level normcore try-hard four loko. Pug fam sartorial semiotics kinfolk direct trade. Tofu post-ironic neutra, jean shorts lyft biodiesel truffaut squid fap celiac helvetica single-origin coffee snackwave fam gochujang. Hoodie succulents godard, tofu 3 wolf moon keffiyeh meditation ugh pabst literally. Intelligentsia ethical drinking vinegar iPhone poke. Enamel pin crucifix live-edge, next level before they sold out lomo plaid disrupt bespoke four loko. Seitan fanny pack kogi coloring book, gastropub forage gluten-free pabst biodiesel mumblecore asymmetrical twee.

Stumptown pop-up cray street art, wolf succulents meggings listicle four dollar toast flannel woke freegan crucifix. Seitan marfa taxidermy snackwave trust fund, fap fanny pack tofu lumbersexual lyft roof party chicharrones. Listicle vape biodiesel, retro migas typewriter jianbing letterpress farm-to-table. Retro sriracha keffiyeh tacos, man braid occupy coloring book chartreuse fanny pack. Neutra portland before they sold out, prism hoodie vaporware actually organic literally farm-to-table tousled put a bird on it crucifix. Four loko kitsch franzen bitters freegan cred, af chillwave waistcoat butcher health goth brunch fashion axe banh mi. Humblebrag flexitarian DIY, migas hella celiac put a bird on it crucifix chicharrones blue bottle fashion axe.

Tacos gochujang brooklyn hashtag pug, literally distillery fashion axe franzen. Fam beard deep v, jean shorts hashtag typewriter four dollar toast hell of shabby chic godard. Polaroid letterpress artisan, chicharrones mlkshk woke intelligentsia meh cardigan iceland trust fund shabby chic four loko. Yr mixtape organic, sustainable tousled umami selfies stumptown. Gluten-free fingerstache vice, 3 wolf moon flannel freegan beard. Shoreditch truffaut irony, hell of flannel la croix raclette. Cray sustainable everyday carry, butcher viral offal meh knausgaard helvetica tattooed.

Typewriter tumeric quinoa, plaid edison bulb air plant man braid selfies truffaut. Brunch glossier wayfarers cray semiotics prism offal. Street art hot chicken organic kinfolk irony, cray edison bulb photo booth put a bird on it dreamcatcher quinoa. Organic normcore +1, helvetica ethical coloring book master cleanse fam. Organic wayfarers deep v craft beer, austin farm-to-table retro crucifix gentrify. Bespoke kombucha forage pitchfork. Austin affogato disrupt squid, lomo typewriter cred snackwave.

Forage authentic PBR&B, subway tile activated charcoal blue bottle leggings flannel lumbersexual VHS tumblr mumblecore kogi. Health goth migas kickstarter chia mixtape. Bushwick direct trade chillwave, fanny pack unicorn sartorial coloring book church-key locavore skateboard. Next level pitchfork iceland, whatever tumblr tofu paleo post-ironic swag brunch authentic coloring book artisan. Freegan street art cardigan umami, fap prism vape plaid man bun viral poke marfa celiac tbh. Cliche skateboard 3 wolf moon tofu mustache, yuccie slow-carb kitsch selfies fashion axe banh mi kickstarter tbh. Air plant PBR&B waistcoat unicorn edison bulb, chillwave tilde 90's meh intelligentsia.

Coloring book hot chicken cronut woke gentrify. Everyday carry put a bird on it fingerstache vegan XOXO, pitchfork pug you probably haven't heard of them butcher mixtape. Taxidermy VHS hammock fanny pack thundercats XOXO. Iceland chambray tote bag slow-carb echo park tbh, small batch yuccie kombucha locavore pork belly drinking vinegar. La croix banh mi live-edge jianbing tattooed post-ironic mlkshk. YOLO sriracha aesthetic 3 wolf moon. Single-origin coffee subway tile freegan, tumeric health goth man braid unicorn.

Mumblecore slow-carb irony, cardigan affogato DIY authentic art party craft beer chillwave. Hella organic cronut keytar blog, salvia franzen portland chartreuse photo booth. Offal tote bag air plant butcher. Leggings letterpress snackwave, food truck small batch jean shorts etsy lo-fi next level. Squid post-ironic freegan franzen, mlkshk thundercats hammock fam pabst locavore unicorn tousled. Hell of pok pok next level affogato pickled. Bicycle rights disrupt bushwick, subway tile humblebrag farm-to-table thundercats distillery pickled meh succulents messenger bag intelligentsia slow-carb.

Hammock sustainable intelligentsia disrupt tousled brooklyn. Farm-to-table jean shorts gluten-free VHS flannel, fap aesthetic la croix quinoa venmo kinfolk kale chips. Prism selfies truffaut schlitz 8-bit. Tbh asymmetrical waistcoat mixtape authentic raw denim. Marfa activated charcoal distillery food truck lo-fi tousled. Mumblecore succulents selvage asymmetrical mixtape, meggings fingerstache man bun. Air plant humblebrag lyft art party.

Air plant hot chicken glossier narwhal. Readymade dreamcatcher asymmetrical organic, chambray air plant taxidermy chartreuse. Artisan irony pinterest freegan polaroid paleo. Lumbersexual seitan iPhone DIY, synth biodiesel la croix beard williamsburg intelligentsia activated charcoal etsy man braid. Church-key ethical ugh, next level kickstarter umami mustache normcore helvetica man braid 3 wolf moon microdosing. Man braid tumeric yuccie, bespoke next level letterpress chia sustainable pork belly gentrify. Franzen poutine disrupt tousled.

Man bun vaporware stumptown freegan paleo deep v. Lomo art party post-ironic, pug pork belly 3 wolf moon try-hard. Bicycle rights master cleanse +1 franzen hell of literally. Brunch schlitz listicle waistcoat, chia banjo tattooed. Quinoa vaporware forage, skateboard actually meh pitchfork. Tumblr tumeric messenger bag, brunch pickled before they sold out hot chicken chambray photo booth authentic normcore PBR&B. Activated charcoal trust fund fap, occupy banjo YOLO poke brooklyn squid.

Biodiesel chillwave plaid portland, williamsburg direct trade keytar blue bottle PBR&B chia artisan YOLO master cleanse pug jianbing. Wayfarers farm-to-table deep v vaporware. Chicharrones flexitarian pitchfork, tattooed snackwave iPhone try-hard banh mi umami cronut green juice kombucha. Taxidermy cardigan banh mi aesthetic, keytar chartreuse everyday carry meggings lomo schlitz prism. Ethical +1 austin twee farm-to-table. Readymade lumbersexual selfies poke lomo vaporware, freegan vape gochujang hashtag celiac prism meh. Microdosing blue bottle vegan dreamcatcher crucifix, tbh kinfolk jianbing listicle ethical occupy yr.

Plaid banjo green juice blue bottle echo park synth locavore you probably haven't heard of them. Unicorn iPhone taxidermy neutra lo-fi. Vegan lyft literally actually, pabst everyday carry messenger bag. Fanny pack truffaut austin, unicorn meh pickled roof party retro cliche tumblr. Wayfarers vice messenger bag, forage crucifix shabby chic authentic actually af jean shorts four dollar toast lumbersexual retro bicycle rights. Organic seitan tumeric, flexitarian DIY gastropub salvia quinoa chicharrones. YOLO distillery everyday carry gastropub.

Williamsburg cray aesthetic fap raclette polaroid. Ramps irony glossier franzen, kitsch chartreuse wayfarers semiotics cardigan. Wolf tousled microdosing offal echo park glossier. Poke brunch distillery chicharrones, cliche locavore occupy drinking vinegar small batch swag. Mumblecore microdosing taxidermy, meditation biodiesel vinyl williamsburg echo park. Synth bespoke put a bird on it tilde. Aesthetic enamel pin man bun lo-fi.

3 wolf moon asymmetrical leggings typewriter, tilde mlkshk venmo occupy. Kale chips vape snackwave prism, selfies beard hashtag craft beer actually selvage authentic deep v photo booth. Master cleanse mlkshk YOLO, shabby chic banjo helvetica umami. Beard bespoke glossier thundercats, sartorial tilde hoodie chartreuse microdosing salvia heirloom la croix. Echo park health goth semiotics, brunch flannel celiac ethical slow-carb poke franzen pop-up. Edison bulb gastropub bespoke art party. Small batch bespoke chartreuse chillwave, food truck lyft tote bag normcore mixtape synth vape lomo marfa authentic.

Tacos sartorial actually, pok pok mustache meggings post-ironic tumeric put a bird on it dreamcatcher yr four dollar toast. Blog pour-over meggings green juice. Synth seitan migas single-origin coffee cardigan. Whatever bitters put a bird on it, humblebrag disrupt cornhole godard iPhone bicycle rights pop-up 3 wolf moon mustache. Roof party twee snackwave post-ironic pop-up lumbersexual, aesthetic chia authentic echo park man bun. Butcher artisan tilde biodiesel jean shorts, blog dreamcatcher meh tattooed tousled woke bicycle rights. Deep v farm-to-table kinfolk, tumblr ethical af single-origin coffee humblebrag.

Cold-pressed gluten-free messenger bag pinterest, godard hashtag thundercats kale chips hot chicken cardigan yuccie. Semiotics PBR&B beard, keffiyeh subway tile williamsburg kale chips roof party. Lumbersexual taxidermy polaroid slow-carb. Bicycle rights listicle direct trade, intelligentsia blog fashion axe migas semiotics bitters cred vinyl scenester PBR&B heirloom pickled. Af umami jianbing bitters echo park art party, wayfarers polaroid hella try-hard artisan. Artisan meggings deep v slow-carb pork belly mlkshk, YOLO quinoa. Sriracha four dollar toast messenger bag, enamel pin slow-carb artisan leggings prism synth poutine edison bulb roof party small batch.

Meggings mlkshk fingerstache you probably haven't heard of them franzen schlitz. Heirloom tousled DIY art party. Shoreditch next level cold-pressed, squid raw denim keffiyeh af. Snackwave ramps meh iPhone, distillery intelligentsia locavore selvage slow-carb chia single-origin coffee cred freegan YOLO. Squid cold-pressed keytar hot chicken, semiotics before they sold out disrupt mlkshk actually. Mustache lyft food truck hella, helvetica biodiesel unicorn. Unicorn fam marfa fap, selvage tumeric craft beer af ugh whatever bicycle rights asymmetrical 90's.

Keffiyeh flannel chicharrones, kickstarter VHS small batch deep v tofu post-ironic franzen lo-fi fixie offal wayfarers four loko. Fixie af messenger bag sustainable affogato, asymmetrical roof party 8-bit seitan. Tumeric tattooed tilde, YOLO vice gentrify kale chips tbh succulents kickstarter. Umami edison bulb vinyl, YOLO actually ramps franzen helvetica enamel pin knausgaard skateboard. Bespoke beard gastropub, bushwick squid meggings kitsch vaporware cold-pressed hammock pug viral polaroid. Meggings blog butcher, readymade fixie vaporware pitchfork PBR&B hell of small batch occupy skateboard flexitarian pinterest. Pickled synth quinoa sustainable, ramps pitchfork XOXO fap beard knausgaard.

Austin skateboard glossier trust fund, VHS tousled YOLO narwhal bitters. Man bun jianbing 8-bit swag food truck mumblecore. Bitters waistcoat truffaut, fixie heirloom ethical artisan distillery lomo kickstarter trust fund tote bag hexagon williamsburg. Pabst actually craft beer direct trade, try-hard selfies gochujang microdosing ramps etsy poke hell of. Echo park pickled schlitz squid mustache, vice tumeric celiac authentic cornhole mumblecore whatever forage waistcoat aesthetic. Poutine pork belly wayfarers roof party. Swag tumeric snackwave chartreuse.

XOXO flexitarian microdosing, marfa prism dreamcatcher DIY +1 bespoke narwhal PBR&B. Farm-to-table brunch glossier locavore, sriracha poutine narwhal crucifix chambray you probably haven't heard of them fap. Vape ethical affogato fingerstache, yuccie green juice everyday carry bushwick live-edge retro readymade chia vice +1 fap. Crucifix pork belly man bun XOXO echo park authentic. Crucifix unicorn kitsch austin photo booth. Celiac sriracha vape, fashion axe pabst helvetica wolf hoodie brooklyn cardigan +1 humblebrag. Offal pabst art party salvia distillery cred la croix, master cleanse mixtape etsy man braid live-edge 90's.

Chambray XOXO selfies, occupy snackwave pok pok asymmetrical fingerstache small batch. Quinoa vaporware mixtape iPhone yr. Flannel gochujang listicle, chicharrones tousled pinterest cronut VHS pok pok raclette tumblr fingerstache. Vice tilde unicorn af. Schlitz 90's hell of tacos, vexillologist man bun ethical quinoa VHS squid cardigan live-edge swag raclette. Yr 8-bit chambray glossier. IPhone prism godard green juice sartorial subway tile gentrify.

Franzen shabby chic before they sold out roof party, gluten-free cred intelligentsia. Deep v listicle 8-bit, post-ironic snackwave sriracha art party banh mi ennui narwhal retro. Direct trade craft beer lomo pop-up, swag blog poutine tacos. Vexillologist VHS prism, scenester meggings taxidermy gastropub shoreditch art party. Tilde skateboard coloring book raclette, irony post-ironic fixie. Deep v vinyl mlkshk, raclette banh mi mumblecore four dollar toast freegan actually hashtag retro. Fashion axe raclette meggings microdosing seitan bushwick.

Wolf drinking vinegar prism, coloring book vinyl vape kinfolk. Godard keytar vape bespoke hexagon tilde umami, twee authentic gastropub four loko narwhal pickled. DIY chambray biodiesel, humblebrag lyft asymmetrical bespoke forage affogato yuccie leggings coloring book migas. Microdosing tbh gochujang keffiyeh, craft beer pitchfork fam mlkshk irony. Squid bushwick craft beer, live-edge heirloom franzen kickstarter chillwave copper mug man braid DIY knausgaard iceland XOXO. Keytar cliche meggings iPhone jianbing health goth hashtag fixie, chia tattooed master cleanse yuccie. Neutra tumeric coloring book roof party.

Wayfarers keytar thundercats, post-ironic locavore direct trade pour-over. Fam YOLO prism bitters, pork belly selvage helvetica retro offal air plant plaid sriracha. Lomo single-origin coffee chartreuse intelligentsia. Fingerstache marfa schlitz, hella etsy aesthetic polaroid cray tofu direct trade la croix. Slow-carb viral selfies ethical brunch, gochujang meggings. Banh mi art party 90's, hashtag taxidermy etsy mlkshk gentrify cornhole seitan fap tumeric microdosing. Pop-up asymmetrical marfa, neutra photo booth chambray thundercats fanny pack iceland.

Normcore affogato literally, prism before they sold out gentrify pour-over letterpress bicycle rights skateboard. Heirloom craft beer iPhone ethical. Ethical tilde mustache crucifix photo booth plaid offal, sustainable affogato. Cray austin kogi, intelligentsia gluten-free brunch whatever fashion axe lo-fi brooklyn trust fund chartreuse hexagon raclette. Mumblecore authentic hoodie, subway tile tumblr unicorn yr hexagon DIY. Woke succulents leggings gochujang four loko keffiyeh jean shorts shabby chic. Craft beer vaporware VHS narwhal yuccie lumbersexual.

Venmo cornhole 90's neutra. Kitsch street art humblebrag, blog banh mi lomo listicle marfa jean shorts DIY. Bicycle rights narwhal quinoa stumptown. Vice taxidermy chia chartreuse semiotics actually, kombucha paleo affogato edison bulb cray pabst authentic succulents thundercats. Unicorn asymmetrical 8-bit fap, art party vinyl godard. Blue bottle pork belly slow-carb, banjo pour-over roof party wayfarers four dollar toast. Brunch tumeric salvia, ramps venmo edison bulb godard polaroid chartreuse jean shorts roof party bushwick paleo raw denim cardigan.

Vaporware williamsburg shabby chic kale chips, mlkshk lo-fi kickstarter letterpress gluten-free kitsch XOXO man braid lyft. Lo-fi glossier four dollar toast master cleanse etsy. Paleo next level small batch mlkshk, coloring book tofu ramps shoreditch sustainable heirloom umami cornhole. Literally affogato craft beer enamel pin, hot chicken viral before they sold out tattooed heirloom ugh. Chillwave skateboard raclette poke, sartorial hell of offal cardigan you probably haven't heard of them try-hard quinoa keytar. Yr 8-bit woke mixtape. Chia offal kickstarter, gochujang shabby chic neutra pok pok.

Tattooed mumblecore heirloom pop-up. Woke migas typewriter, +1 vinyl squid vice tousled affogato iceland thundercats bicycle rights. +1 gluten-free enamel pin echo park mlkshk. Deep v chicharrones subway tile, dreamcatcher pok pok jean shorts edison bulb tacos chambray chillwave brooklyn gastropub. Leggings gentrify hot chicken coloring book migas artisan. Tote bag poke kombucha leggings, seitan quinoa tousled marfa raw denim put a bird on it glossier prism occupy ugh four dollar toast. Hexagon quinoa tattooed woke flexitarian, typewriter intelligentsia whatever banjo organic cliche raw denim VHS single-origin coffee ramps.

Kickstarter actually church-key, lo-fi ugh shabby chic gochujang flannel kinfolk leggings chambray. Tofu hashtag schlitz heirloom. Wolf austin food truck godard, fingerstache flannel tattooed fanny pack copper mug. Pitchfork authentic coloring book subway tile blog flannel. Mustache pickled try-hard, af bespoke coloring book microdosing artisan subway tile woke prism tumblr crucifix fap venmo. Messenger bag dreamcatcher disrupt selfies tofu. Aesthetic trust fund la croix, kogi single-origin coffee locavore four dollar toast pickled.

Forage chia mlkshk edison bulb cornhole. Lumbersexual coloring book yuccie pitchfork, literally try-hard kitsch. Asymmetrical 8-bit irony ennui austin kombucha. Plaid vape chillwave tattooed locavore YOLO, distillery cronut lomo letterpress crucifix cray leggings. Hammock cronut kickstarter biodiesel helvetica, pitchfork trust fund poke. Kickstarter yr austin, sartorial prism enamel pin tote bag viral whatever stumptown cred you probably haven't heard of them. Copper mug cold-pressed photo booth, mustache typewriter neutra beard mlkshk brooklyn ennui polaroid hot chicken blue bottle vape.

Taxidermy fanny pack pour-over cred fam, prism blog intelligentsia DIY roof party tacos kitsch gentrify. Organic gochujang fam 8-bit cred, artisan portland. Skateboard whatever bicycle rights four dollar toast tofu sartorial sustainable coloring book, austin poutine waistcoat 90's single-origin coffee. XOXO narwhal listicle iPhone. YOLO kogi disrupt authentic unicorn bitters, mustache blog enamel pin fanny pack trust fund master cleanse lyft. Tumeric pabst forage, gastropub put a bird on it jianbing aesthetic polaroid sriracha cray art party. Art party literally knausgaard, PBR&B forage tbh portland hexagon tilde stumptown four loko next level everyday carry.

Craft beer gentrify VHS bushwick, fam raclette narwhal. YOLO hexagon tousled, dreamcatcher banjo celiac pok pok cardigan. Banjo distillery butcher, cold-pressed activated charcoal echo park street art green juice master cleanse gochujang squid. Pitchfork waistcoat artisan four dollar toast. Organic cronut bicycle rights gastropub lo-fi, YOLO before they sold out blue bottle synth neutra schlitz mumblecore. Blog butcher sriracha hoodie, plaid pitchfork unicorn food truck. Fam celiac VHS, ethical post-ironic coloring book green juice tbh raclette semiotics vexillologist.

Air plant seitan vice, drinking vinegar tofu tote bag jianbing kombucha banjo messenger bag. Helvetica four loko VHS literally. Gentrify hella meggings, activated charcoal bitters etsy biodiesel blue bottle shabby chic jianbing viral sriracha. Pitchfork humblebrag austin shoreditch pour-over intelligentsia. Kinfolk scenester chartreuse brooklyn lomo pug XOXO, af bushwick gochujang vice asymmetrical green juice etsy leggings. Listicle art party street art, messenger bag asymmetrical cred drinking vinegar bushwick cliche organic fashion axe photo booth. Skateboard activated charcoal cronut, church-key green juice tofu pok pok organic ethical scenester cray marfa kombucha jianbing.

Lyft ennui stumptown kinfolk, 8-bit put a bird on it lo-fi austin post-ironic pork belly cold-pressed narwhal knausgaard celiac. Tumeric ugh portland distillery try-hard. Bitters umami chillwave taxidermy ennui, iPhone glossier. Slow-carb jean shorts shabby chic pabst man bun VHS la croix pour-over. Vegan flexitarian pop-up viral scenester. Pug umami keytar roof party microdosing. La croix meh vape street art, artisan wayfarers ennui mixtape.
HIPSTER


def table_definitions
  tables = <<-SQLTABLES
\\c "users-messages"

--CREATE TABLE users (id SERIAL PRIMARY KEY, email TEXT NOT NULL UNIQUE, username TEXT NOT NULL UNIQUE, image_url TEXT, password TEXT);

--CREATE TABLE messages (id SERIAL PRIMARY KEY, text TEXT NOT NULL, timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, user_id INTEGER REFERENCES users);

--CREATE TABLE likes (id SERIAL PRIMARY KEY, message_id INTEGER REFERENCES messages, user_id INTEGER REFERENCES users);

--CREATE TABLE follows (id SERIAL PRIMARY KEY, followee_id INTEGER REFERENCES users, follower_id INTEGER REFERENCES users);

SQLTABLES
  tables
end


hip_sub = $hipster.gsub(/^$\n/,'').delete("\n")
$hipster_arr = hip_sub.split(/\./).map(&:strip).map{|s| s[0...140]}

def time_rand from = 1451649601.0, to = Time.now
  t = Time.at(from + rand * (to.to_f - from.to_f))
  t.strftime "%Y-%m-%d %H:%M:%S"
end

def random_user not_allowed = [-1]
  user = rand($num_users) + 1
  while not_allowed.include? user do
    user = rand($num_users) + 1
  end
  user
end

def random_profile_image
  $profile_urls[rand($profile_urls.length)]
end

def random_header_image
  $header_image_urls[rand($header_image_urls.length)]
end

def insert_users
  str = "INSERT INTO users (email, username, image_url, header_image_url, bio, location, password) VALUES "

  users = []
  emails = []
  user_output = []

  for i in 1..$num_users
    new_email = Faker::Internet.email
    if emails.include? new_email
      new_email = (rand(5000) + 300).to_s + new_email
    end
    emails.push new_email

    new_user = Faker::Internet.user_name
    if users.include? new_user
      new_user = new_user + (rand(200) + 30).to_s
    end
    users.push new_user

    user_output.push "('#{new_email}', '#{new_user}', '#{random_profile_image}', '#{random_header_image}', 'Im super cool', '#{Faker::Address.city}', '$2b$12$s4gUmTg2tpwSH2J5T/YYeOdUKWYRO4AhTMgpQn.m49EIn5tL1Tzmu'),"
  end

  user_output[-1] = user_output[-1].chomp(",") + ";"

  str + user_output.join("\n")
end

$authors = {}

def insert_messages
  $hipster_arr = $hipster_arr.map {|s| s.strip.gsub("'", "''")}

  $authors = {}
  count = 0

  output = $hipster_arr.map do |s|
    str = "('"
    str += s
    str += "',"
    str += "TIMESTAMP '"
    str += time_rand
    str += "',"
    user = random_user
    str += user.to_s
    str += "),"
    $authors[count] = user
    count += 1
    str
  end

  output[-1] = output[-1].chomp(',') + ";"
  insert_str = "INSERT INTO messages (text, timestamp, user_id) VALUES "

  insert_str + output.join("\n")

end

def insert_likes
  likes = []

  for i in 0...$hipster_arr.length
    num_likes = rand(30)
    not_allowed = [$authors[i]]
    message_id = i + 1
    for j in 0...num_likes
      not_allowed.push(random_user not_allowed)
      str = "(" + message_id.to_s + "," + not_allowed[-1].to_s + "),"
      likes.push str
    end
  end

  likes[-1] = likes[-1].chomp(',') + ";"

  insert_str = "INSERT INTO likes (message_id, user_id) VALUES "
  insert_str + likes.join("\n")
end


def insert_followers
  followers_output = []

  for i in 1..$num_users
    num_follow = rand(25)
    followers = [i]
    for j in 0...num_follow
      user = random_user followers
      followers.push user
      followers_output.push("(" + i.to_s + "," + user.to_s + "),")
    end
  end

  followers_output[-1] = followers_output[-1].chomp(',') + ";"

  insert_str = "INSERT INTO follows (followee_id, follower_id) VALUES "

  insert_str + followers_output.join("\n")
end

def all_inserts
  # removed insert_likes
  insert_users + "\n\n" + insert_messages + "\n\n" + insert_followers
end

puts all_inserts
