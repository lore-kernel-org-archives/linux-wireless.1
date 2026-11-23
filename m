Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=eCBblMNkopTCdUv3TEgQDHu2hOyICe1RMMYTunm2jdf2huqIwzmIrGAQvKBTn18O5NaI
	 GSaf2QkkSAdvKYBreTjBa+WVNXMfnPriPODIzAPW8JIBgGOLhK7EFlaISpUX5Y3kvHvfh
	 wf9vc/lv/il18VK7knys7mDY6QlmkGShyFjt2+4LBqUiHfK5zijJQJfwp/jjzelPEx+bZ
	 M9r/5lEQBR14cr+CMnWftwcn9FFI32e1//CDXcuJFY8ACn0545o5x2f1PMj//YZd7aw51
	 9JAc2MTNFXd/rhzC4PjI7sVsk4Aqz2yRvyfVvt4C7DBc6qZLkvT9snxXmwHSXfKRgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Yqu8VdKcKDG/3MUp+phK9ADVLCVo7MZLeiXCWwfL6k=;
	b=s8zh/5tQRHEhZ5d43PxQ3m5mkmie/Wnd04Z13zh/0SQxrJNc8RzWaELdoPELnW7bKFMS
	 W8yx5iLkzHiHUlOGeIOWZk3lGpe5b2WRr5YwgcDHTaJ7PnAJiyxH0Lt63bDIsLjiJJjM1
	 U+JURPVzKx/rvMtkMmg4fQLW/2ZBfe9z8/ilaRSjwmsypSTLpw3moCWFaFs1nGMkwaBAY
	 oxk0tms01cke5LKjhoP/omz/wEBtrPddR9nSpbsdAaJpu74veoIRVjDCH6NAh3BVJ2E6/
	 DGchgnnH0u9zY7DcwNnVdjh9/JyXTz0ts0zrDsqHWYg1bqEiQ++nbHTcd7K4pdcpyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XIyxPQNr;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38007606A32D
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38007606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=XIyxPQNr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3Yqu8VdKcKDG/3MUp+phK9ADVLCVo7MZLeiXCWwfL6k=; b=XIyxPQNrNLcy35bJ9ErjlAIdnN
	TeQJ8zbRSfsHtJlA5C/gWuUr/f6WIX7FSpvCk9evPFUcpQELBXJ6jYyfdVjrneX7nhRZRYVYrE/Hy
	tybXL7/tYhYugMxU4FxdOwGfrUotlgxyPKNUM34OKaNBnIsfPSqifBfLiBb/pYe2mhI4=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-2o
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/20] wifi: mt76: mt7615: leave the BIP check of a group frame to mac80211
Date: Mon, 23 Nov 2026 14:49:06 +0100
Message-ID: <20261123134920.154270-7-nbd@nbd.name>
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

mt7615_mac_fill_rx() sets RX_FLAG_DECRYPTED and RX_FLAG_IV_STRIPPED
for every frame whose RXD carries a cipher. That includes a group
addressed robust Management frame that the hardware matched with the
IGTK. The MME of such a frame stays in place, and the driver installs
the IGTK without an IPN.

With both flags, ieee80211_rx_h_decrypt() takes the frame as verified
and checks neither the MIC nor the IPN. No check of the IPN in the
hardware is known. A station with PMF can thus accept a replayed group
Deauthentication or Disassociation of its AP.

Do not report a frame with a BIP cipher as decrypted. mac80211 then
selects the IGTK by the key id of the MME, and checks the IPN and the
MIC. It also removes the MME. For an offloaded IGTK, it uses the CMAC
key that it keeps.

Fixes: 01cfc1b45421 ("mt76: mt7615: add BIP_CMAC_128 cipher support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8e81ebe3e2ca..0def4ba75817 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -348,6 +348,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	u8 chfreq, amsdu_info, qos_ctl = 0;
 	u16 seq_ctrl = 0;
 	__le16 fc = 0;
+	u8 sec_mode;
 
 	memset(status, 0, sizeof(*status));
 
@@ -397,7 +398,9 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	if (rxd2 & MT_RXD2_NORMAL_TKIP_MIC_ERR)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2) != 0 &&
+	/* a BIP frame keeps its MME, for mac80211 to check MIC and IPN */
+	sec_mode = FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2);
+	if (sec_mode != 0 && sec_mode != MT_CIPHER_BIP_CMAC_128 &&
 	    !(rxd2 & (MT_RXD2_NORMAL_CLM | MT_RXD2_NORMAL_CM))) {
 		status->flag |= RX_FLAG_DECRYPTED;
 		status->flag |= RX_FLAG_IV_STRIPPED;
@@ -427,7 +430,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			switch (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2)) {
+			switch (sec_mode) {
 			case MT_CIPHER_AES_CCMP:
 			case MT_CIPHER_CCMP_CCX:
 			case MT_CIPHER_CCMP_256:
-- 
2.47.3

