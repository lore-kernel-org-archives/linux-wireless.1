Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306497;
	b=Oy/81MD7Zm1YJJXH49mfVE5eBJFmg/pW2PKPjw/2P4sIWQqvseopkD0yn8eNqpZq1DGd
	 vCZBVZ0q7tdWxbjEZM4AzTDNvQfQW1ALKU0ApxPf28qxRiaDtTJc7h3y5enLyIR37w5mQ
	 rAEdqXiF1HrF61fVvhv8nKmXb9ea6KStlrA58a1uR2LmNG6lbxTgcWrSTUnqZYBo/R6sU
	 Pp3jpDTMTODyPTilnOcc2ARA6h9FpaJtnvXllutqpdGd+lAkkoUV5yfMBe8HmjXVg2Udp
	 AId5Q29ysMkRoB0/W2fCxSANmccXd4iUfHnZz7t1CkZLS/46UBGjteP4HFI+dCe7FrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306497;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=eWSedapFvl0DW+ZPixdBSDVBH8dvACW7Wj+MSIJiI7c=;
	b=4Dz0ZccP4vL55beyRyjUayFOcCva1MXxF6SsnnIB9QK9ZSSbyFMasXmLNKn2ZFPPuKfk
	 tl5pY31L2sn2IuDsjrbkxY+mDHBDdvyjqonx4MgQ6lHT3fjZTKHVkOPhjm3+eKX9WjTrM
	 V2FJSSFIi4LOpmJoxDUhPBmDDofl2vMZsmKbgplxx4RcW6zdx3TTaIQ7w3GDJC68u/V50
	 wIif5+1pvy81ILjH/OL3T/s2vxhUQaPWtMc3aLSI8PPKWhpn7Ye92QAs5OTaroj8OnfEY
	 Rw9pdg+QiWbviWBj1ziu1H52uBon9XCX+12f1e+BvB5JSA7TtZINu23/0uRKSjRR/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Undc862Y;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81130606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 00:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81130606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Undc862Y
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 045F182EC1;
	Sun, 22 Nov 2026 01:14:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTig8uYSp_Im; Sun, 22 Nov 2026 01:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1795306494; bh=2zyGN6LWA4TaW1GtuYKAslGUAfbn7RsSooxDzfw1GN8=;
	h=From:To:Cc:Subject:Date;
	b=Undc862YOZSKVSQ1uyxQHgKguGxgRyma12+/mydSd2Uk1Gpy5g1vHvMHMfYDmiQ0F
	 Vhws1W8T6ScOSzYCBvvweT50yXOoUguBCB0Q5witbRqTs6/5UK0AUa8BQjhHFtvjLx
	 NhWeu1jQAf+uatbHWM9w0Dyb1ZDafRN2q0c8uayD3bQoIRpt3LlFinPzOyYyISQNmu
	 hhgPdLWPz5MnHIuwVUQ68tg+NGwtsS2h2vM1XWdX1tQxPy/O6R9zHRwYt2QVVzSF2J
	 3Qovbkt3QkrQ1ilwzf3ALvPtAggJAM4iI7Xa8ICxXA0JXMA0oaPBs2bE1WxJ+bheUU
	 7HiFxVV2Aob7Q==
From: Florian Maurer <fmaurer@disroot.org>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH wireless-next v2] wifi: mac80211: mesh: drop frames received on another channel
Date: Sun, 22 Nov 2026 00:14:24 +0000
Message-ID: <20261122001424.3276331-1-fmaurer@disroot.org>
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
---
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

