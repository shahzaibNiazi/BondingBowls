import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';





class EditAiAvatar extends StatefulWidget {
  const EditAiAvatar({super.key});

  @override
  State<EditAiAvatar> createState() => _EditAiAvatarState();
}

class _EditAiAvatarState extends State<EditAiAvatar> {

  String selectedTop = 'LongHairStraight';
  String selectedAccessories = 'Blank';
  String selectedHairColor = 'BrownDark';
  String selectedFacialHair = 'Blank';
  String selectedClothes = 'BlazerShirt';
  String selectedEyes = 'Default';
  String selectedEyebrow = 'Default';
  String selectedMouth = 'Default';
  String selectedSkin = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                        Navigator.pop(context);
                    }, 
                icon: SvgPicture.asset("assets/icon/svg/back_arrow.svg") 
                ),
                  ],
                ),
                Text(
                  "Customize your Avatar", 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                    ),
                ),
          
                // Avatar circle
                Image.asset(
                  'assets/images/AI-AVATAR.jpg', // Replace with your image
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 20),
          
          
                Column(
                  children: [
                    _buildDropdownRow(
                      label: 'Top',
                      value: selectedTop,
                      items: ['LongHairStraight', 'ShortHairDreads01', 'ShortHairShortCurly', 'LongHairBigHair'],
                      onChanged: (value) => setState(() => selectedTop = value!),
                    ),
                    _buildDropdownRow(
                      label: '👓 Accessories',
                      value: selectedAccessories,
                      items: ['Blank', 'Kurt', 'Prescription01', 'Prescription02', 'Round', 'Sunglasses', 'Wayfarers'],
                      onChanged: (value) => setState(() => selectedAccessories = value!),
                    ),
                    _buildDropdownRow(
                      label: '💈 Hair Color',
                      value: selectedHairColor,
                      items: ['BrownDark', 'Auburn', 'Black', 'Blonde', 'BlondeGolden', 'Brown', 'PastelPink', 'Platinum', 'Red', 'SilverGray'],
                      onChanged: (value) => setState(() => selectedHairColor = value!),
                    ),
                    _buildDropdownRow(
                      label: 'Facial Hair',
                      value: selectedFacialHair,
                      items: ['Blank', 'BeardMedium', 'BeardLight', 'BeardMagestic', 'MoustacheFancy', 'MoustacheMagnum'],
                      onChanged: (value) => setState(() => selectedFacialHair = value!),
                    ),
                    _buildDropdownRow(
                      label: '👔 Clothes',
                      value: selectedClothes,
                      items: ['BlazerShirt', 'BlazerSweater', 'CollarSweater', 'GraphicShirt', 'Hoodie', 'Overall', 'ShirtCrewNeck', 'ShirtScoopNeck', 'ShirtVNeck'],
                      onChanged: (value) => setState(() => selectedClothes = value!),
                    ),
                    _buildDropdownRow(
                      label: '👁️ Eyes',
                      value: selectedEyes,
                      items: ['Default', 'Close', 'Cry', 'Dizzy', 'EyeRoll', 'Happy', 'Hearts', 'Side', 'Squint', 'Surprised', 'Wink', 'WinkWacky'],
                      onChanged: (value) => setState(() => selectedEyes = value!),
                    ),
                    _buildDropdownRow(
                      label:'✏️ Eyebrow',
                      value: selectedEyebrow,
                      items: ['Default', 'DefaultNatural', 'FlatNatural', 'RaisedExcited', 'RaisedExcitedNatural', 'SadConcerned', 'SadConcernedNatural', 'UnibrowNatural', 'UpDown', 'UpDownNatural'],
                      onChanged: (value) => setState(() => selectedEyebrow = value!),
                    ),
                    _buildDropdownRow(
                      label: '👄 Mouth',
                      value: selectedMouth,
                      items: ['Default', 'Concerned', 'Disbelief', 'Eating', 'Grimace', 'Sad', 'ScreamOpen', 'Serious', 'Smile', 'Tongue', 'Twinkle', 'Vomit'],
                      onChanged: (value) => setState(() => selectedMouth = value!),
                    ),
                    _buildDropdownRow(
                      label: '🎨 Skin',
                      value: selectedSkin,
                      items: ['Light', 'Tanned', 'Yellow', 'Pale', 'DarkBrown', 'Black'],
                      onChanged: (value) => setState(() => selectedSkin = value!),
                    ),
                    SizedBox(height: 20,),

                    Text("*Do note that first avatar creation is complimentary, future changes will require bowls",textAlign:TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffBC0072),
                      fontStyle: FontStyle.italic,
                      fontSize: 13,
                      fontWeight: FontWeight.w300
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(285, 40),
                      backgroundColor: Color(0xffC672A5)
                    ),                    
                    child:Text("Confirm",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      // fontStyle: FontStyle.italic,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                      ),
                    )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildDropdownRow({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
       Row(
        children: [
          // Container(
          //   width: 24,
          //   height: 24,
          //   decoration: BoxDecoration(
          //     color: iconColor,
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   child: Icon(
          //     icon,
          //     color: Colors.white,
          //     size: 16,
          //   ),
          // ),
          SizedBox(width: 12),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
