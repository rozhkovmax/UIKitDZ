//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Maxim on 22.09.2022.
//

import UIKit
/// Контроллер "читалки"
final class BookViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let bookText = """
I
Октябрь уж наступил — уж роща отряхает
Последние листы с нагих своих ветвей;
Дохнул осенний хлад — дорога промерзает.
Журча еще бежит за мельницу ручей,
Но пруд уже застыл; сосед мой поспешает
В отъезжие поля с охотою своей,
И страждут озими от бешеной забавы,
И будит лай собак уснувшие дубравы.

II
Теперь моя пора: я не люблю весны;
Скучна мне оттепель; вонь, грязь — весной я болен;
Кровь бродит; чувства, ум тоскою стеснены.
Суровою зимой я более доволен,
Люблю ее снега; в присутствии луны
Как легкий бег саней с подругой быстр и волен,
Когда под соболем, согрета и свежа,
Она вам руку жмет, пылая и дрожа!

III
Как весело, обув железом острым ноги,
Скользить по зеркалу стоячих, ровных рек!
А зимних праздников блестящие тревоги?..
Но надо знать и честь; полгода снег да снег,
Ведь это наконец и жителю берлоги,
Медведю, надоест. Нельзя же целый век
Кататься нам в санях с Армидами младыми
Иль киснуть у печей за стеклами двойными.

IV
Ох, лето красное! любил бы я тебя,
Когда б не зной, да пыль, да комары, да мухи.
Ты, все душевные способности губя,
Нас мучишь; как поля, мы страждем от засухи;
Лишь как бы напоить, да освежить себя —
Иной в нас мысли нет, и жаль зимы старухи,
И, проводив ее блинами и вином,
Поминки ей творим мороженым и льдом.

V
Дни поздней осени бранят обыкновенно,
Но мне она мила, читатель дорогой,
Красою тихою, блистающей смиренно.
Так нелюбимое дитя в семье родной
К себе меня влечет. Сказать вам откровенно,
Из годовых времен я рад лишь ей одной,
В ней много доброго; любовник не тщеславный,
Я нечто в ней нашел мечтою своенравной.

VI
Как это объяснить? Мне нравится она,
Как, вероятно, вам чахоточная дева
Порою нравится. На смерть осуждена,
Бедняжка клонится без ропота, без гнева.
Улыбка на устах увянувших видна;
Могильной пропасти она не слышит зева;
Играет на лице еще багровый цвет.
Она жива еще сегодня, завтра нет.

VII
Унылая пора! очей очарованье!
Приятна мне твоя прощальная краса —
Люблю я пышное природы увяданье,
В багрец и в золото одетые леса,
В их сенях ветра шум и свежее дыханье,
И мглой волнистою покрыты небеса,
И редкий солнца луч, и первые морозы,
И отдаленные седой зимы угрозы.

VIII
И с каждой осенью я расцветаю вновь;
Здоровью моему полезен русской холод;
К привычкам бытия вновь чувствую любовь:
Чредой слетает сон, чредой находит голод;
Легко и радостно играет в сердце кровь,
Желания кипят — я снова счастлив, молод,
Я снова жизни полн — таков мой организм
(Извольте мне простить ненужный прозаизм).

IX
Ведут ко мне коня; в раздолии открытом,
Махая гривою, он всадника несет,
И звонко под его блистающим копытом
Звенит промерзлый дол и трескается лед.
Но гаснет краткий день, и в камельке забытом
Огонь опять горит — то яркий свет лиет,
То тлеет медленно — а я пред ним читаю
Иль думы долгие в душе моей питаю.

X
И забываю мир — и в сладкой тишине
Я сладко усыплен моим воображеньем,
И пробуждается поэзия во мне:
Душа стесняется лирическим волненьем,
Трепещет и звучит, и ищет, как во сне,
Излиться наконец свободным проявленьем —
И тут ко мне идет незримый рой гостей,
Знакомцы давние, плоды мечты моей.

XI
И мысли в голове волнуются в отваге,
И рифмы легкие навстречу им бегут,
И пальцы просятся к перу, перо к бумаге,
Минута — и стихи свободно потекут.
Так дремлет недвижим корабль в недвижной влаге,
Но чу! — матросы вдруг кидаются, ползут
Вверх, вниз — и паруса надулись, ветра полны;
Громада двинулась и рассекает волны.

XII
Плывет. Куда ж нам плыть?
"""
        static let increaseThicknessFont = "A"
        static let reduceThicknessFont = "a"
        static let nameTextFont = ["Helvetica", "Times New Roman", "Optima", "American Typewriter"]
        static let textFont = [UIFont(name: "Helvetica", size: 17),
                               UIFont(name: "Times New Roman", size: 17),
                               UIFont(name: "Optima", size: 17),
                               UIFont(name: "American Typewriter", size: 17)]
    }
    
    // MARK: - Private Properties
    private let bookTextView = UITextView()
    private let sizeTextSlider = UISlider()
    private let sizeLabel = UILabel()
    private let fontsPicker = UIPickerView()
    private let backgroundColorSwitch = UISwitch()
    private let increaseThicknessFontButton = UIButton(type: .roundedRect)
    private let reduceThicknessFontButton = UIButton(type: .roundedRect)
    private let textColorBlackButton = UIButton(type: .roundedRect)
    private let textColorWhiteButton = UIButton(type: .roundedRect)
    private let textColorRedButton = UIButton(type: .roundedRect)
    private let textColorBlueButton = UIButton(type: .roundedRect)
    private let shareButton = UIButton(type: .roundedRect)
                                      
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        allMetod()
    }
    
    // MARK: - Private Methods
    private func createTextView() {
        bookTextView.frame = CGRect(x: 20, y: 90, width: view.bounds.width - 40,
                                    height: view.bounds.height / 2)
        bookTextView.text = Constants.bookText
        bookTextView.isEditable = false
        bookTextView.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        bookTextView.font = UIFont.systemFont(ofSize: 17)
        bookTextView.backgroundColor = .white
        view.addSubview(bookTextView)
    }
    
    private func createButton() {
        increaseThicknessFontButton.frame = CGRect(x: 300, y: 670, width: 50, height: 50)
        increaseThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        increaseThicknessFontButton.setTitle(Constants.increaseThicknessFont, for: .normal)
        increaseThicknessFontButton.addTarget(self, action: #selector(increaseThicknessFontAction), for: .touchUpInside)
        view.addSubview(increaseThicknessFontButton)
        
        reduceThicknessFontButton.frame = CGRect(x: 300, y: 720, width: 50, height: 50)
        reduceThicknessFontButton.titleLabel?.font = UIFont(name: "Times New Roman", size: 30)
        reduceThicknessFontButton.setTitle(Constants.reduceThicknessFont, for: .normal)
        reduceThicknessFontButton.addTarget(self, action: #selector(reduceThicknessFontAction), for: .touchUpInside)
        view.addSubview(reduceThicknessFontButton)
        
        textColorBlackButton.frame = CGRect(x: 50, y: 600, width: 40, height: 40)
        textColorBlackButton.backgroundColor = .black
        textColorBlackButton.layer.borderWidth = 1
        textColorBlackButton.layer.borderColor = UIColor.gray.cgColor
        textColorBlackButton.layer.cornerRadius = textColorBlackButton.frame.size.height / 2
        textColorBlackButton.addTarget(self, action: #selector(textColorBlackAction), for: .touchUpInside)
        view.addSubview(textColorBlackButton)
        
        textColorWhiteButton.frame = CGRect(x: 100, y: 600, width: 40, height: 40)
        textColorWhiteButton.backgroundColor = .white
        textColorWhiteButton.layer.borderWidth = 1
        textColorWhiteButton.layer.borderColor = UIColor.gray.cgColor
        textColorWhiteButton.layer.cornerRadius = textColorWhiteButton.frame.size.height / 2
        textColorWhiteButton.addTarget(self, action: #selector(textColorWhiteAction), for: .touchUpInside)
        view.addSubview(textColorWhiteButton)
        
        textColorRedButton.frame = CGRect(x: 150, y: 600, width: 40, height: 40)
        textColorRedButton.backgroundColor = .red
        textColorRedButton.layer.borderWidth = 1
        textColorRedButton.layer.borderColor = UIColor.gray.cgColor
        textColorRedButton.layer.cornerRadius = textColorRedButton.frame.size.height / 2
        textColorRedButton.addTarget(self, action: #selector(textColorRedAction), for: .touchUpInside)
        view.addSubview(textColorRedButton)
        
        textColorBlueButton.frame = CGRect(x: 200, y: 600, width: 40, height: 40)
        textColorBlueButton.backgroundColor = .blue
        textColorBlueButton.layer.borderWidth = 1
        textColorBlueButton.layer.borderColor = UIColor.gray.cgColor
        textColorBlueButton.layer.cornerRadius = textColorBlueButton.frame.size.height / 2
        textColorBlueButton.addTarget(self, action: #selector(textColorBlueAction), for: .touchUpInside)
        view.addSubview(textColorBlueButton)
        
        shareButton.frame = CGRect(x: 280, y: 760, width: 100, height: 50)
        shareButton.setTitle("Поделиться", for: .normal)
        shareButton.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        view.addSubview(shareButton)
    }
    
    private func createSlider() {
        sizeTextSlider.frame = CGRect(x: 20, y: 550, width: 374, height: 30)
        sizeTextSlider.thumbTintColor = .link
        sizeTextSlider.minimumValue = 10
        sizeTextSlider.maximumValue = 70
        sizeTextSlider.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        view.addSubview(sizeTextSlider)
    }
    
    private func createPicker() {
        fontsPicker.frame = CGRect(x: 20, y: 640, width: 250, height: 160)
        fontsPicker.delegate = self
        fontsPicker.dataSource = self
        view.addSubview(fontsPicker)
    }
    
    private func createSwitch() {
        backgroundColorSwitch.frame = CGRect(x: 300, y: 605, width: 0, height: 0)
        backgroundColorSwitch.onTintColor = .link
        backgroundColorSwitch.addTarget(self, action: #selector(backgroundColorAction), for: .valueChanged)
        backgroundColorSwitch.isOn = true
        view.addSubview(backgroundColorSwitch)
    }
    
    private func allMetod() {
        createButton()
        createSlider()
        createPicker()
        createSwitch()
        createTextView()
    }
    
    // MARK: - objc Private Methods
    @objc private func increaseThicknessFontAction() {
        bookTextView.font = UIFont.boldSystemFont(ofSize: bookTextView.font?.pointSize ?? 10)
    }
    
    @objc private func reduceThicknessFontAction() {
        bookTextView.font = UIFont.systemFont(ofSize: bookTextView.font?.pointSize ?? 10)
    }
    
    @objc private func textColorBlackAction() {
        bookTextView.textColor = .black
    }
    
    @objc private func textColorWhiteAction() {
        bookTextView.textColor = .white
    }
    
    @objc private func textColorRedAction() {
        bookTextView.textColor = .red
    }
    
    @objc private func textColorBlueAction() {
        bookTextView.textColor = .blue
    }
    
    @objc private func backgroundColorAction() {
        if backgroundColorSwitch.isOn {
            view.backgroundColor = .white
            bookTextView.backgroundColor = .white
        } else {
            view.backgroundColor = .black
            bookTextView.backgroundColor = .black
        }
    }
    
    @objc private func sizeTextAction() {
        bookTextView.font = bookTextView.font?.withSize(CGFloat(sizeTextSlider.value))
    }
    
    @objc private func shareAction() {
        let url = URL(string: "https://vk.com")
        let buttonActivityViewController = UIActivityViewController(activityItems: [url ?? "Cбой",
                                                                                    bookTextView.text ?? "Сбой"],
                                                                    applicationActivities: nil)
        present(buttonActivityViewController, animated: true)
    }
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension BookViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.textFont.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.nameTextFont[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bookTextView.font = Constants.textFont[row]
    }
}
