import 'package:flutter/material.dart';
import 'package:my_app/components/pages/class/destination_class.dart';
import 'package:my_app/components/pages/detailed_destination.dart';



class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Destination> _allDestinations = [
    Destination(
      title: 'Hotel Fazenda Recanto do Sossego',
      location: 'Brasil, Zona rural, Deodápolis - MS',
      rating: 4.8,
      description:
          'Um refúgio tranquilo com paisagens exuberantes, ideal para relaxar e aproveitar a natureza. Oferece atividades como trilhas, passeios a cavalo e piscina.',
      contact: '(35) 99999-8888',
      imageUrl: 'images/deadopolis.jpg',
    ),
    Destination(
      title: 'Camping Chapada dos Veadeiros',
      location: 'Brasil, Alto Paraíso de Goiás - GO',
      rating: 4.5,
      description:
          'Aproveite a beleza natural da Chapada dos Veadeiros acampando em meio a cachoeiras e formações rochosas incríveis. Uma experiência única de contato com a natureza.',
      contact: '(62) 98888-7777',
      imageUrl: 'images/camping.webp',
    ),
    Destination(
      title: 'Pousada Beira Mar Porto de Galinhas',
      location: 'Brasil, Porto de Galinhas, Ipojuca - PE',
      rating: 4.9,
      description:
          'Localizada à beira-mar da famosa Porto de Galinhas, esta pousada oferece conforto e fácil acesso às piscinas naturais e praias paradisíacas.',
      contact: '(81) 97777-6666',
      imageUrl: 'images/pgalinhas.jpg',
    ),
    Destination(
      title: 'Eco Lodge Amazônia Aventura',
      location: 'Brasil, Paricatuba, Amazonas - AM',
      rating: 4.7,
      description:
          'Explore a rica biodiversidade da Amazônia hospedando-se neste eco lodge sustentável. Desfrute de passeios de barco, observação de animais e trilhas na selva.',
      contact: '(92) 96666-5555',
      imageUrl: 'images/amaz.jpg',
    ),
    Destination(
      title: 'Refúgio Alpino Campos do Jordão',
      location: 'Brasil, Jardim Alpestre, Campos do Jordão - SP',
      rating: 4.6,
      description:
          'Desfrute do clima europeu em Campos do Jordão neste charmoso refúgio alpino. Ideal para casais e famílias que buscam tranquilidade e paisagens montanhosas.',
      contact: '(12) 95555-4444',
      imageUrl: 'images/refugee.png',
    ),
  ];

  List<Destination> _filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    _filteredDestinations.addAll(_allDestinations);
  }

  void _filterDestinations(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDestinations.clear();
        _filteredDestinations.addAll(_allDestinations);
      } else {
        _filteredDestinations = _allDestinations
            .where((destination) =>
                destination.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos de Viagem'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterDestinations,
              decoration: const InputDecoration(
                labelText: 'Buscar destino',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = _filteredDestinations[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DestinationDetailScreen(destination: destination),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            destination.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Text('Erro ao carregar imagem'));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      destination.title,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        destination.rating.toStringAsFixed(1),
                                      ),
                                      const SizedBox(width: 4.0),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.red,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.grey, size: 16.0),
                                  const SizedBox(width: 4.0),
                                  Expanded(
                                    child: Text(
                                      destination.location,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}