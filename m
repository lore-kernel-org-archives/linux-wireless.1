Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224118;
	b=Lq97C3B0K4jr6FB2qe6WoYW8+AnmO/ycKRpNBO8WWapVg9uIsX7EZBmYmIAkXR5FY9kh
	 74Qa7Yh5wJwN9ZgOmkES5/y0pz8ygV9sJCboSoSHQkrKsX4opPb5czRGxiXPDz9kr3C7r
	 XlpdqYZJq5zzqeI0zkrP6fgMyxS3aYrdFB3kOxRyARYZrkcYjPpEzISB6WBX2MZjf7sFy
	 /8+JA2B/7cJ0w1qoQj8ArvIKdAENWhpUz5Jun7TySdqFkBxO6tXscWJu96Nv33ghoQ+Ez
	 4L3DyAFidg6uvMuN53WjIEkPLJFTB7bqmU2IaOX+Re5E09vRnUnXVeggzH3esE/PEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224118;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=kHGy4neXo1lK/IpjieGRAkNsb1jeFnwneECuMsSY//M=;
	b=ZDQ1S2vR/vfet6B9vmIDE+Da7B36055e4R15WP2AJ0oK+jJPbJeTBXF2M4tmfrQ9Y8Ee
	 OtEeVQL5BcopGSDfV7QrlXNBisBdrSWOWKRcMR/9oW2zOlFsrrUBBu8OD5UtQX4aVXaya
	 NooX7u1qjC+k/8d0MV/mnE9hgex5NzLTAJkLrfmG77xr1iHxKv6kzUKrlC0eTCZD+M10f
	 J0qoXgueH995VVkvh985Nyfuozdib1jrHB0IgxdrxSzhfF3yT/pcakHDmHF5T5C2wnqcY
	 OX5P90AVP+ZNr/X0ARpeF2r5cMUCUec5kr5e+Iv19EEZUNe57QNfj+pvSnEUyILjenw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b="fjd7N4/z";
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C7606A69E
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 01:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666C7606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=fjd7N4/z
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B2F6082F52;
	Sat, 21 Nov 2026 02:21:54 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y30E9hSlud9O; Sat, 21 Nov 2026 02:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795224114; bh=8XspCu2cvj+1HEpQrFgtE1kP4L88NMPdae1pXiB7WRM=;
	h=From:To:Cc:Subject:Date;
	b=fjd7N4/zLKdZCndTOra8SpuwS4RcPUBrzZ0DOuYy/2AGwq3n9aQMEuvn6BOpaibvJ
	 kjZAfCk/6UPZ/uddU9R0dRmgKsRDxdfFlW6Y5kZ/zAaSrXABiAeigzT9628CLDwwoy
	 5MfYn33itWettKWKGaCBD9yocnNYIKuVpTQ6/h17DQGSGDKcaiamWATPA/gclF0aUy
	 23tF6q9r+wo48+6Qj/D2iK7WX2+2NFlEx/qHgm9I2r4ptberwjIt2F+uNPAiroEvJo
	 t80VllVCFt3aqs4ucc2Wq1tT4JALeTcmy0FIB3t9u+mqQEGIO/Hu2yM/snxoNgDxO0
	 NhMEXQVZEs1iA==
From: Florian Maurer <fmaurer@disroot.org>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>
Subject: [PATCH wireless-next] wifi: mac80211: mesh: drop frames received on another channel
Date: Sat, 21 Nov 2026 01:21:49 +0000
Message-ID: <20261121012149.1506406-1-fmaurer@disroot.org>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Frames from a known station are only passed to it if they were received
on the channel of its link, see ieee80211_rx_valid_freq(). Frames
without a matching station, such as beacons and peering frames of a new
neighbour, are passed to every interface regardless of the channel they
were received on.

A mesh interface then creates stations for mesh points it hears on
other channels and tries to peer with them. This happens on a wiphy
with multiple radios, where every interface gets the frames of all
radios, and can also happen while a wiphy scans. With mac80211_hwsim
(multi_radio=1) and two wiphys, each with a mesh on 2412 and on
5180 MHz, every mesh interface ends up with an established peering to
both interfaces of the other wiphy, as the peering frames reach the
interface on the other band the same way. A ping over such a peering
does not get through.

mesh_matches_local() only accepts such a neighbour if the basic rates
match, so a 2.4 GHz mesh is only affected towards 5 GHz if it does not
use the 802.11b rates, which is common when legacy rates are disabled.

Drop these frames on a joined mesh interface unless they were received
on its channel. A mesh interface is never an MLD, so its deflink is the
link to check. Other interface types are not changed, as they need to
receive frames off-channel, e.g. for remain-on-channel.

Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
Tested on wireless-next (e1dd848680) in qemu with mac80211_hwsim
radios=3 multi_radio=1 regtest=5: mesh "test" with basic-rates 6,12,24
on 2412 and 5180 MHz on phy0 and phy1, and on 5240 MHz on phy2.

Without the patch, each of the four interfaces on phy0/phy1 has two
ESTAB peerings, one with each interface of the other wiphy. With it,
each has only the peer on its own channel. Link-local pings on both
bands: 20/20 before and after a CSA of the 5 GHz mesh from 5180 to
5200 MHz (iw dev ... switch freq 5200 beacons 5), the peerings stay
ESTAB. No lockdep or RCU splats (PROVE_LOCKING, PROVE_RCU). Also built
with CONFIG_MAC80211_MESH=n.

The problem was seen on an mt7996 board (three radios on one wiphy)
running a mesh on 2.4 and 5 GHz; this version was only tested with
hwsim.

 net/mac80211/rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd176..d76833f41a 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5606,6 +5606,12 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
 		/* No station, try to resolve the link and RX */
 		link = ieee80211_link_from_freq(sdata, status->freq);
 
+		/* a mesh only peers on its own channel, not via other radios */
+		if (ieee80211_vif_is_mesh(&sdata->vif) &&
+		    sdata->u.mesh.mesh_id_len &&
+		    !ieee80211_rx_valid_freq(status, link))
+			continue;
+
 		if (rx_data_pending) {
 			ieee80211_prepare_and_rx_handle(&rx, skb, false);
 			rx_data_pending = false;
-- 
2.39.5

