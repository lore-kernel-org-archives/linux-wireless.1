Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306695;
	b=BSfArIDGhrVxCPrdr9tQlThzqbFly9EH/QVnBtuw4X4Noc0jvYtV/gRAOeW71Iu1N0AR
	 haNMQGDAAoMaA0kSjpCzIKOxYSCkxDzh0FgEMBrORBIG66XsswcuGQ0l4A8heaOQFgC6l
	 B/iMOQZIjSYWJiQLJEjUvtAxcLZHy18XJpFffByWNNGprhuC734OrsLFweIjwQgkuF6ML
	 XHG+k5vu2gn80PfXI6Q+nFOMZ8y2ccIUuW0Wyf6QuDwHOBo6AQ5/k1TilyhrPQlrj45l3
	 RkyFGPzZk7w4xpelE2cfQGNUDHhkRqQRi9kQQ3xLqKlWYpw9ojFwvMXFTlcUBKK0Qfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306695;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=CEckpgMINDsTwovGzNqc0M2xw+v8hJN1D/sdCqkepGU=;
	b=tcl2DRTZnKu75ENlD9P0gM0Wti26HLZuYUQXLEvkmZkiTMUKExzzoixK2KcjadzGQ5vf
	 wJtkojh5QIshncWHE0ScvmxK65owIryLplAv3btCPZemKsFFN3bREstfMdjtEtgVGqVZZ
	 x5TIVsOS580LHhd2H8Ztx6JY1NSifQc7WLEFe/RlL6Zltjr+rHLH7oZUWG3b+gQOpIcAX
	 aTb5Y2Ep9IzRH1f2ulb37GHsjqU2Re6uhEqhw1Jx4awpIyTVsPbLYMK2ZFchaH5kpLnj3
	 O5hsGG194rLSKPqPROUXlY/vOEhFvpF5El2RyQb7UVPoFy26ZvJPQ5gGu0rw5MxTUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=CGDwQsIy;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F68606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 00:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F68606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=CGDwQsIy
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C1FD38302C;
	Sun, 22 Nov 2026 01:18:13 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VI8vMjEFBZVB; Sun, 22 Nov 2026 01:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795306692; bh=i4+P1MkxSAl67Bq7g+9k0aIQEDK7p2w8RxuZ/MJ8qOM=;
	h=From:To:Cc:Subject:Date;
	b=CGDwQsIyE8b8y9nmjtIMr8uqM2XB8HdKNjkrBhfnoojFIutADkdmbrsZoVKIa/35Z
	 bNoR5A5KoyQ4p8vM1FhxBwA9qXjVXHBXwr1/OnmK2Gi0x/G13SfzQj62H/zd1fNgE+
	 NhmnixZluWe8zDWBDWCC5eP0+antwcltuBIa6Jy9yVK2sISxrodzXugTaH4DUd3Q92
	 U9coGvYw3su3MF92X3wi1VVp3mXTTaHZCUTNbTBWzRGO2suV6OhcwbydtSc6a54Y1r
	 jHEAQniSh+rm8tFRBlTNqv0bqfiqnp75174GHTHAsL6JwqmlRT7DzpTxgzpL8tLcLK
	 JJrJGmu/VrIvw==
From: Florian Maurer <fmaurer@disroot.org>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH wireless-next v3] wifi: mac80211: mesh: drop frames received on another channel
Date: Sun, 22 Nov 2026 00:18:05 +0000
Message-ID: <20261122001805.3288390-1-fmaurer@disroot.org>
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
on the channel of its link. Frames without a matching station, such as
beacons and peering frames of a new neighbour, reach every interface
regardless of the channel they were received on.

On a wiphy with multiple radios, a mesh interface therefore peers with
mesh points on the channels of the other radios. With mac80211_hwsim
(multi_radio=1), a 2.4 GHz mesh interface ends up with an established
peering to the 5 GHz mesh interface of another wiphy, and no traffic
gets through it. As mesh_matches_local() requires matching basic rates,
this only happens if the 2.4 GHz mesh does not use the 802.11b rates.

Drop these frames in ieee80211_mesh_rx_queued_mgmt() unless they were
received on the channel of the mesh. No other frames are accepted from
a neighbour without an established peering. A mesh interface is never
an MLD, so bss_conf holds its channel.

Suggested-by: Benjamin Berg <benjamin@sipsolutions.net>
Signed-off-by: Florian Maurer <fmaurer@disroot.org>
---
v3:
- Added the missing Signed-off-by.
- v2: https://lore.kernel.org/linux-wireless/20261122001424.3276331-1-fmaurer@disroot.org/

v2:
- Moved the check from __ieee80211_rx_handle_packet() to
  ieee80211_mesh_rx_queued_mgmt(), as only mesh needs it. rx.c is not
  changed any more.
- Shortened the commit message, dropped the unconfirmed scan case.
- v1: https://lore.kernel.org/linux-wireless/20261121012149.1506406-1-fmaurer@disroot.org/

Tested on wireless-next (e1dd848680) in qemu with mac80211_hwsim
radios=3 multi_radio=1 regtest=5: mesh "test" with basic-rates 6,12,24
on 2412 and 5180 MHz on phy0 and phy1, and on 5240 MHz on phy2.

Without the patch, each of the four interfaces on phy0/phy1 has two
ESTAB peerings, one with each interface of the other wiphy, and unicast
over the cross-band peering does not get through. With it, each has
only the peer on its own channel. Link-local pings on both bands: 20/20
before and after a CSA of the 5 GHz mesh from 5180 to 5200 MHz
(iw dev ... switch freq 5200 beacons 5), the peerings stay ESTAB. No
lockdep or RCU splats (PROVE_LOCKING, PROVE_RCU).

The problem was seen on an mt7996 board (three radios on one wiphy)
running a mesh on 2.4 and 5 GHz.

 net/mac80211/mesh.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index e93303dce6..40a618cfd1 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -1696,6 +1696,12 @@ void ieee80211_mesh_rx_queued_mgmt(struct ieee80211_sub_if_data *sdata,
 		return;
 
 	rx_status = IEEE80211_SKB_RXCB(skb);
+
+	/* a mesh only peers on its own channel, not via other radios */
+	if (rx_status->freq !=
+	    sdata->vif.bss_conf.chanreq.oper.chan->center_freq)
+		return;
+
 	mgmt = (struct ieee80211_mgmt *) skb->data;
 	stype = le16_to_cpu(mgmt->frame_control) & IEEE80211_FCTL_STYPE;
 

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.39.5

