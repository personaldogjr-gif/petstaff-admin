<?php

namespace Modules\Blog\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Modules\Blog\Models\Blog;
use Illuminate\Support\Arr;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class BlogTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
     public function run()
    {
        // Sempre executar, independente da variável de ambiente
        try {
            $data = [
                0 => 
                array (
                    'id' => 1,
                    'name' => 'How to feed pills to dogs',
                    'description' => '<p>Giving medication to dogs can be challenging but with a few helpful tips, you can make the process more pleasant for both you and your furry friend.</p><p><strong>Pill pockets</strong>
        </p><p>Pill pockets are soft dog treats with a notch cut out to hide your pet\'s medicine in. If your dog can take medication with food, try using a pill pocket or wrapping the pill in soft food like cheese. This makes it easier to slip the pill into your dog\'s system. Keep in mind that this works best for dogs that quickly gobble treats without chewing. If your dog tends to chew soft treats, they might discover the medicine making it harder to administer next time. If your dog has food sensitivities or allergies, consult your veterinarian before using pill pockets.
        </p><p><strong>Compounded medications</strong>
        </p><p>Some medications come in flavoured compounded or chewable "treat" tablet forms, which can be more appealing to dogs who struggle with swallowing pills. However, these options may be more expensive, and certain medications may not be suitable for compounding due to potential effectiveness issues. Not all pharmacies compound medications, so ask your veterinarian for recommendations.</p><p><strong>Pill device</strong>
        </p><p>Administering pills to your dog can be risky as it may result in accidental bites if your fingers go near their teeth. Pill devices offer a safer alternative by allowing you to place the medication in your dog\'s mouth without exposing your fingers to danger. To ensure success, place the pill behind the hump on your dog\'s tongue, close their jaws, and gently stroke their throat in a downward motion to encourage swallowing.</p><p><strong>Ask for assistance</strong>
        </p><p>Trying to restrain your dog while giving them medication can be challenging. If possible, ask a friend or family member to hold your dog for you, allowing you to focus entirely on the task at hand.</p><p>Remember, the health and well-being of your dog is paramount. Always follow your veterinarian\'s instructions and seek their advice if you have any concerns or questions.
        </p>',
                        'tags' => 'Animal, Care, HealthIssue',
                        'status' => 1,
                        'blog_image' => '/dummy-images/blog-image/feedpillsdogs.png',
                        'created_by' => NULL,
                        'updated_by' => 1,
                        'deleted_by' => NULL,
                        'created_at' => '2023-08-29 06:54:50',
                        'updated_at' => '2023-09-13 07:06:19',
                        'deleted_at' => NULL,
                    ),
                    1 => 
                    array (
                        'id' => 2,
                        'name' => 'How to take care of stray animals during monsoon',
                        'description' => '<p>As responsible individuals, it is our duty to care for these animals. Let\'s explore some ways in which we can assist them during the monsoon season.</p><p><strong>Accommodate them at home or in your society</strong></p><p>Seek permission from the relevant authorities in your society to allow stray animals to find shelter in your apartment complex. If you live in a house, consider allocating a small dry area in your garage or a porch for them to seek refuge and stay safe from the rain.</p><p><strong>Provide temporary shelters</strong></p><p>Creating permanent animal shelters in overcrowded cities can be challenging. However, you can set up temporary shelters using tents, wood, or tin sheets in public gardens, open areas, or grounds. Ensure that the chosen location is hygienic and safe for animals, and not likely to get flooded.</p><p><strong>Arrange for food, water, and medical supplies</strong></p><p>It\'s crucial to provide these animals with adequate food, water, and medical care. Encourage your community to contribute by taking turns to provide fresh food and clean water. Maintain a first-aid kit and keep a stock of essential medical supplies to treat sick animals. Use old newspapers, old clothes and sheets for the strays to curl up in, so that they can keep warm and dry. This goes a long way in helping the strays maintain their health and preventing sickness.</p><p><strong>Assist injured animals</strong> </p><p>During heavy rains, stray animals are at an increased risk of getting into accidents, and contracting fatal infections / diseases from clogged drains and stagnant water. If you come across an injured animal in distress, contact the nearest pet hospital or vet clinic for assistance.</p><p><strong>Support local animal shelters</strong></p><p>Animal shelters face additional challenges during the monsoon season. They require more food, water, and medical supplies to cater to the growing demand. Consider visiting local shelters to understand their needs and accordingly offer support. If you\'re unable to provide financial assistance, you can still contribute by volunteering your time or donating items like newspapers, old clothes, bedsheets or furniture.</p><p><strong>Seek help from animal experts and NGOs</strong></p><p>In situations where you are unable to alleviate the suffering of a stray animal, reach out to the appropriate authorities. Look for animal helplines or contact nearby NGOs and animal shelters for assistance. </p><p>Let\'s keep in mind that stray animals deserve the same love and care we provide to our pets. This monsoon season, let\'s extend a helping hand and make a difference in their lives.
        </p>',
                        'tags' => 'StrayDog, Care, Animal',
                        'status' => 1,
                        'blog_image' => '/dummy-images/blog-image/takecare-of-stray-animals-monsoon.png',
                        'created_by' => NULL,
                        'updated_by' => 1,
                        'deleted_by' => NULL,
                        'created_at' => '2023-09-02 06:54:50',
                        'updated_at' => '2023-09-13 07:14:04',
                        'deleted_at' => NULL,
                    ),
                    2 => 
                    array (
                        'id' => 3,
                        'name' => 'Stray vs. Feral: What to do when you come across a feral cat',
                        'description' => '<p>Stray cats are domestic cats that have been lost or abandoned, distinguished from feral cats. Having missed out on vital socialisation, feral cats behave more like wild animals compared to gentle house cats. Here\'s a ready reckoner to help you distinguish between the different types of wandering cats that surround us in our urban lives.</p><p><strong>Friendly stray</strong></p><p>Keep an eye out for collars on these amiable kitties. They may belong to a nearby neighbor or find themselves lost or abandoned, yearning for care and attention.</p><p><strong>Community cat</strong></p><p>Unlike cats with traditional owners, community cats are cared for by the community at large. While they may display a certain degree of friendliness, their level of socialisation can vary.</p><p><strong>Friendly feral</strong></p><p>Through minimal socialisation facilitated by regular feeding, friendly feral cats may exhibit some trust toward the human who provides sustenance. However, they have not reached a level of socialisation where physical touch, such as petting, is welcomed.</p><p><strong>Feral</strong></p><p>Truly feral cats lack any form of socialisation. They remain perpetually vigilant, deeply suspicious of human presence. At the first sight or sound of people, they swiftly flee.</p><p><strong>Helping feral cats in your area</strong></p><p>It is an undeniable fact that feral and stray cats endure harsh lives while navigating the perils of the outdoors. Sadly, many feral cats do not live past the age of two, a stark contrast to the extended lifespans enjoyed by indoor house cats, which can exceed 20 years. As compassionate individuals, we can take the following steps to alleviate their plight:</p><p><strong>Spay and neuter</strong></p><p>The first and most crucial step in assisting both indoor cats and free-roaming community cats is to promote and prioritise spaying and neutering. This essential measure helps control the population and prevent further suffering.</p><p><strong>Education and advocacy</strong></p><p>Educate others about the significance of spaying, neutering, and vaccinating cats. By spreading awareness, we can foster a community that actively participates in responsible pet care. Advocate for local sponsorship of low-cost spay and neuter clinics to ensure accessibility for all.</p><p><strong>Basic necessities</strong></p><p>Provide fresh, clean water to feral cats in your area. A small act like this can make a significant difference in their well-being. When feeding, offer modest portions in the mornings.</p><p><strong>Shelter initiatives</strong></p><p>Consider building a cat house or investing in an all-weather cat shelter. These shelters offer a safe haven for both stray and feral cats, protecting them from harsh weather conditions.</p><p>Seek guidance from local shelters: If you encounter a free-roaming cat or kitten and are uncertain about how best to help, reach out to your local shelter. They can provide valuable advice and support, guiding you through the process of assisting these felines effectively.</p>',
                        'tags' => 'StrayCat, FeralCat',
                        'status' => 1,
                        'blog_image' => '/dummy-images/blog-image/stray-feral-cat.png',
                        'created_by' => NULL,
                        'updated_by' => 1,
                        'deleted_by' => NULL,
                        'created_at' => '2023-08-14 06:54:50',
                        'updated_at' => '2023-09-13 07:31:10',
                        'deleted_at' => NULL,
                    ),
                    3 => 
                    array (
                        'id' => 4,
                        'name' => 'What to do when you find an injured stray animal',
                        'description' => '<p>Encountering an injured stray animal can be a distressing situation but there are steps you can take to ensure their safety and well-being. Here\'s how you can best assess the situation, provide temporary care and find appropriate assistance, making a significant difference in the injured animal\'s life.</p><p><strong>Assess the situation</strong></p><p>When you come across an injured animal, it\'s important to assess the situation before you take any action. This will ensure your safety as well as the safety of the animal.</p><p><strong>Contact the local animal shelter</strong></p><p>If you believe the injured animal may pose an immediate threat to people or other animals, contact your local animal shelter immediately. They will have the necessary expertise and resources to handle the situation effectively.</p><p><strong>Approach with caution</strong></p><p>Approach the injured stray animal slowly and calmly, avoiding direct eye contact and sudden movements. Speak in a low, soft, reassuring tone to help calm the animal.</p><p><strong>Assess the injuries</strong></p><p>Evaluate the animal\'s injuries from a safe distance. If the injuries seem severe or life-threatening, it\'s best to wait for the trained professionals to arrive on the scene. Make a note of the injuries and provide this information to the authorities when they arrive. </p><p><strong>Contact local rescue organisations</strong></p><p>Reach out to local animal rescue organisations like AMTM in your area. They will provide guidance on how to proceed and may have resources to help with the care and rehabilitation of the injured stray. </p><p><strong>Stay with the animal</strong></p><p>If possible, stay with the animal until help arrives. Your presence can be comforting and reassuring to the animal during a distressing time.</p><p>Coming across an injured stray animal requires compassion and prompt action. By following these steps, you can help alleviate the fear and suffering of the animal while waiting for professional assistance. Your efforts and action can make all the difference to the animal\'s chances of survival, recovery, and a brighter future.
        </p>',
                        'tags' => 'StrayDog, Injury, Care, Animal',
                        'status' => 1,
                        'blog_image' => '/dummy-images/blog-image/injured-stray-animal.png',
                        'created_by' => NULL,
                        'updated_by' => 1,
                        'deleted_by' => NULL,
                        'created_at' => '2023-09-12 06:54:50',
                        'updated_at' => '2023-09-13 07:32:58',
                        'deleted_at' => NULL,
                    ),
                    4 => 
                    array (
                        'id' => 5,
                        'name' => 'How to keep your pet flea and tick-free',
                        'description' => '<p>As pet owners, we want our furry friends to be happy and healthy, and part of that is keeping them safe from fleas and ticks. These tiny parasites can cause a lot of discomfort as well as transmit diseases. Fortunately, there are many ways to prevent fleas and ticks from infesting your pet. Here are some tips to help you keep your pet flea and tick-free.</p><p><strong>Use a flea and tick preventative medication</strong></p><p>There are many different types of flea and tick medications available in the market, including oral medications, topical treatments, and collars. Speak to your vet to determine which type of medication is best for your pet based on their age, weight, and overall health.</p><p><strong>Do not use canine medication for felines</strong></p><p>Don\'t use flea and tick preventives meant for dogs on your cats and vice versa. Some of these products contain harmful ingredients that can cause serious reactions. The labels on these products will indicate the approved species, so make sure to use them only as directed.</p><p><strong>Groom your pet regularly</strong></p><p>Spending time grooming your pet is not only an opportunity for bonding but also a chance to check for any external parasites that might be hiding beneath their fur.</p><p>Use natural remediesThere are many natural remedies that can help to repel fleas and ticks, such as essential oils like cedarwood, lavender, and peppermint. However, be cautious when using these remedies, as some essential oils can be toxic to pets especially when they are not diluted properly or administered incorrectly. Always speak to your vet before using any natural remedies on your pet.
        </p>',
                        'tags' => 'Pet, Care, Animal, Protect',
                        'status' => 1,
                        'blog_image' => '/dummy-images/blog-image/pet-flea-tick-free.png',
                        'created_by' => NULL,
                        'updated_by' => 1,
                        'deleted_by' => NULL,
                        'created_at' => '2023-08-25 06:54:50',
                        'updated_at' => '2023-09-13 07:34:49',
                        'deleted_at' => NULL,
                    ),
                ];
                
                $blogsCreated = 0;
                foreach ($data as $key => $val) {
                    try {
                        // Criar o blog com o campo blog_image
                        $blog = Blog::create($val);
                        $blogsCreated++;
                        
                        Log::info("Blog criado: {$blog->name} (ID: {$blog->id}) com imagem: {$blog->blog_image}");
                        
                    } catch (\Exception $e) {
                        Log::error("Erro ao criar blog '{$val['name']}': " . $e->getMessage());
                    }
                }
                
                Log::info("BlogTableSeeder executado com sucesso! {$blogsCreated} blogs criados.");
                
            } catch (\Exception $e) {
                Log::error("Erro fatal no BlogTableSeeder: " . $e->getMessage());
                throw $e;
            }
    }
}