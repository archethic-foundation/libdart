// Project imports:
import 'package:uniris_lib_dart/api.dart';
import 'package:uniris_lib_dart/crypto.dart' as crypto;
import 'package:uniris_lib_dart/model/key_pair.dart';
import 'package:uniris_lib_dart/utils.dart';

/*
 * Derive an address
 * @param {String} seed TransactionChain seed
 * @param {int} index Number of transaction in the chain
 * @param {String} curve  Elliptic curve to use ("ed25519", "P256", "secp256k1")
 * @param {String} hashAlgo  Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
 */
String deriveAddress(String seed, int index,
    {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
  final KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve);
  return uint8ListToHex(crypto.hash(keypair.publicKey, algo: hashAlgo));
}

/*
 * Get the last address
 * @param {String} seed TransactionChain seed
 * @param {String} endpoint
 */
Future<String> lastAddress(String seed, String endpoint) async {
  final String genesisAddress = deriveAddress(seed, 0);
  final int index = await sendTx(genesisAddress, endpoint);
  final String lastAddress = deriveAddress(seed, index);
  return lastAddress;
}
