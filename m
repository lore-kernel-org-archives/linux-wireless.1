Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441766;
	b=0721/92Ox/DbJ+g+XuJWLXkw5C0xv+0GtmUV8P7k1GtfiKR8XqZ4gmgsw547rhPfNTmt
	 QjpG4eayrMJn5dXRs391FPZ/xWIeh6Rujs6QmiED28etMR4c1gNCgqh0brxRU3sRUr/Gj
	 CeGHWiF6B2OqAEMTCI9p5wFuFKjlfTlmLxHpR6xAvr0VMyVd+U1QdzuIoSxsQD08NEnOS
	 Qp1zfQp/LItByzWU9/jNBAUpjPne2PgzXrcqoHHWISGozdQj/ex9Q3PW1rKupWG6+nhPg
	 6DwM3JTdYtUvJO2RQM7x5s66yteMgxFiHQHXW8ExSojGlV1f3fXqo19xM+cL7SW0HZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jW/lxR1RvlqN647UasMbJe5Uh60vw+GeMO+CwawagBA=;
	b=gAPZ5PhzRsLCoSxeNj0aVfcl1rbah6VSxoASoCnMvJNlF0uVSK7J2y4azItZ3NMO4vTT
	 L9/o601h6mi3E6gXsCIvStaoseTN+GxVOsmNmXPtpKBk2+xOVzaTXZ8D9WivtXOkqGfJ7
	 2EqzEZYnsZ/XCth7pvD8ghRaMvJnOE56bdwke2oHy9kyJiq9CZiA3VtLPCJ9+lTG0LtZG
	 j8STA+AEyeVz9zj0DR+weSGcwAP9bjMWmazAXOwJ5bzc02IoKqDgdTv2rc+kVkmtMn4eE
	 Zn4CMy8mte6xRJHy8ypxHTIlsZJ4dEDFIf6yAkPzVbSSIxxrtNhg0BfdcDpNJJ26fxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dFmNVRK0;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19057606A69B
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19057606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dFmNVRK0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jW/lxR1RvlqN647UasMbJe5Uh60vw+GeMO+CwawagBA=; b=dFmNVRK0Mg/WYuNVQO6nfI8dJN
	N/tdmM3woUK1JFL4KtdzqPrMyHi91IwK3/9f2KLyCqquIC+cZoAcGIGUk4jKCcOWG2MCSZBcOl2CN
	1fBVbQWsUxfHs1djX866K7vplD4Uykd/97bnHCBrlRJLxo1mQ49r/tdHjahJ84J6hW/I=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-2K
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 18/20] wifi: mt76: mt7996: send the SRG bitmaps in one block per band
Date: Mon, 23 Nov 2026 14:49:17 +0100
Message-ID: <20261123134920.154270-18-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7996_mcu_set_obss_spr_bitmap() sends the SRG BSS colour and partial
BSSID bitmaps as four arrays of two words, indexed by band. The
firmware expects one block of four words for each of the three bands
and refuses the shorter TLV, so no SRG bitmap reaches the hardware.
On band 2 the driver also writes past the request on the stack.
Reachable via mt7996_link_info_changed() for an enabled spatial reuse
parameter set, with the sr_scene_detect module parameter off.

Send one block per band, holding the colour bitmap and then the
partial BSSID bitmap, and fill the block of the band, like the other
per-band arrays in mcu.h that take __MT_MAX_BAND entries.

Fixes: cf6dc2db17fe ("wifi: mt76: mt7996: add support to configure spatial reuse parameter set")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c    | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 33aace532222..28f932fe049e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -5301,10 +5301,12 @@ mt7996_mcu_set_obss_spr_bitmap(struct mt7996_phy *phy,
 		__le16 tag;
 		__le16 len;
 
-		__le32 color_l[2];
-		__le32 color_h[2];
-		__le32 bssid_l[2];
-		__le32 bssid_h[2];
+		struct {
+			__le32 color_l;
+			__le32 color_h;
+			__le32 bssid_l;
+			__le32 bssid_h;
+		} __packed spr_bitmap[__MT_MAX_BAND];
 	} __packed req = {
 		.band_idx = phy->mt76->band_idx,
 		.tag = cpu_to_le16(UNI_CMD_SR_SET_SRG_BITMAP),
@@ -5313,16 +5315,16 @@ mt7996_mcu_set_obss_spr_bitmap(struct mt7996_phy *phy,
 	u32 bitmap;
 
 	memcpy(&bitmap, he_obss_pd->bss_color_bitmap, sizeof(bitmap));
-	req.color_l[req.band_idx] = cpu_to_le32(bitmap);
+	req.spr_bitmap[req.band_idx].color_l = cpu_to_le32(bitmap);
 
 	memcpy(&bitmap, he_obss_pd->bss_color_bitmap + 4, sizeof(bitmap));
-	req.color_h[req.band_idx] = cpu_to_le32(bitmap);
+	req.spr_bitmap[req.band_idx].color_h = cpu_to_le32(bitmap);
 
 	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap, sizeof(bitmap));
-	req.bssid_l[req.band_idx] = cpu_to_le32(bitmap);
+	req.spr_bitmap[req.band_idx].bssid_l = cpu_to_le32(bitmap);
 
 	memcpy(&bitmap, he_obss_pd->partial_bssid_bitmap + 4, sizeof(bitmap));
-	req.bssid_h[req.band_idx] = cpu_to_le32(bitmap);
+	req.spr_bitmap[req.band_idx].bssid_h = cpu_to_le32(bitmap);
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(SR), &req,
 				 sizeof(req), true);
-- 
2.47.3

