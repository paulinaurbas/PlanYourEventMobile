import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planyoureventmobile/models/supplier_model.dart';
import 'package:planyoureventmobile/my_flutter_app_icons.dart';
import 'package:planyoureventmobile/screens/main/upcoming_party/supliers/widgets/supliers_information_row.dart';
import 'package:planyoureventmobile/styling/dictionary.dart';

class SupliersCard extends StatefulWidget {
  final Supplier supplier;
  const SupliersCard({
    Key key, this.supplier,
  }) : super(key: key);

  @override
  _SupliersCardState createState() => _SupliersCardState();
}

class _SupliersCardState extends State<SupliersCard> {
  @override
  void initState() {
    super.initState();
  }

  bool suppliersHasAddress (){
    if(widget.supplier.address.city == null && widget.supplier.address.street == null){
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool suppliersAddress = suppliersHasAddress();
    return Padding(
      padding: const EdgeInsets.only(left: 19, right: 19, top: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(suppliersAddress ? 0: 15, 15, 12, 12),
                    child:
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                              child: Text(widget.supplier.supplierName,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold
                                  )),
                            ),
                          ],
                        ),
                        widget.supplier.address.street != null ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.transparent),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0, top: 8.0, bottom: 8.0),
                              child: Text(widget.supplier.address.street,
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                            ),
                          ],
                        ) : Container(),
                        widget.supplier.address.city != null ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.transparent),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 8.0),
                              child: Text(widget.supplier.address.city,
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                            ),
                          ],
                        ) : Container(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SupliersInformationRow(
                    icon: Icons.phone_outlined, title: widget.supplier.phone,)
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 9),
                  child: SupliersInformationRow(
                    icon: Icons.mail_outline_outlined, title: widget.supplier.email,)
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 9),
                  child: SupliersInformationRow(
                    icon: Icons.person_outline_outlined,
                    title: widget.supplier.personResponsible,)),
              Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 9),
                  child: SupliersInformationRow(
                    icon: Icons.assignment_outlined, title: widget.supplier.staffFromSupplier,)),
            ],
          )),
    );
  }
}
