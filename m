Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441764;
	b=3WzuI7Vmb1sLjxm2r+yP8jsyIO70EyHP0L3lNzGwRABstDyQbxNrE+kPTxd2nJy7PHhK
	 u9szrA2KDYd79dCFRY2cZjO+JpMkIUV4gFINKd7NVWF3aBHQ7RiZwcZKS8kAgMb9pdkie
	 HCPOC2nkXR9ofNJdD+5ce1SPUE8iL562n7ILt4yL5DrfA+sliC+PHhGDJrOk0gow0M4ri
	 26M7goLp4U5gbsKYA4O/2GPwof2PPJydmnfcEQvp+ax25x9/C2zjs4hijEz8826XpoBmj
	 WR06WlBmUnbZryfs3a24WFtd/ogyQuEk7v4XRvgrOgKe6V8fe8q7mcE6s6EyV+v8BaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441764;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uo9WGOud5qYA+rW7BeqktRgp/qza9s1D+nL8U6zy1xs=;
	b=mWdcEew4Y9IE/fEtmZ35lz6YiPoBgNtIqopCQ1Q+RmQFibU6LCdbIPp3IEaDULG7aQar
	 4du0pfyWwIZLXexjx3T7mtOavSFOQm51H7x7tcst915EsgaNSyEKfOmI5ZyljiQhfxml/
	 VqvuBHZG7ap0C32MuReF09wcueKTnAyn37Uh8d9B7IJICuSIUEF2UJjrpSyjz/Id2V/OE
	 kuxdQ0UaFvUFzIuC9h3k9cKRrPwlBfmABrQS9gGRRauHDDudOjsukfenp5nC6mBCX9dMH
	 skam6zktpwHDxX2TR66aFZJW4VnEpHbT2kLp4zyQkPvxL9/mfKLWPItWjKUMBupYW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D0ZNs2Hi;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9EC606A31F
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB9EC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D0ZNs2Hi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Uo9WGOud5qYA+rW7BeqktRgp/qza9s1D+nL8U6zy1xs=; b=D0ZNs2HiNNI9O2EXtiiI7S2gaQ
	z8YWgjAqk7/XzxU/mv/ozJE5KmTxHxqgtHdJmvcca1ebqfk8ba5drKyiKVnI4HNRxI9j4wG4vTqYr
	a1CA7Kk3U/AxE7BDamcJWLb2x4VlNchfz56iOXskv7abeknXsajyQot4u18rvMfjRrjc=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ6-007NFk-1i
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/20] wifi: mt76: mt7921: leave the BIP check of a group frame to mac80211
Date: Mon, 23 Nov 2026 14:49:04 +0100
Message-ID: <20261123134920.154270-5-nbd@nbd.name>
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

mt7921_mac_fill_rx() sets RX_FLAG_DECRYPTED and RX_FLAG_IV_STRIPPED
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

Fixes: e0f9fdda81bd ("mt76: mt7921: add ieee80211_ops")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 6f5e31489e2d..a2d577872566 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -188,6 +188,7 @@ mt7921_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	u16 seq_ctrl = 0;
 	__le16 fc = 0;
 	u8 mode = 0;
+	u8 sec_mode;
 	int idx;
 
 	memset(status, 0, sizeof(*status));
@@ -247,7 +248,9 @@ mt7921_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 	if (rxd1 & MT_RXD1_NORMAL_TKIP_MIC_ERR)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
-	if (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1) != 0 &&
+	/* a BIP frame keeps its MME, for mac80211 to check MIC and IPN */
+	sec_mode = FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1);
+	if (sec_mode != 0 && sec_mode != MT_CIPHER_BIP_CMAC_128 &&
 	    !(rxd1 & (MT_RXD1_NORMAL_CLM | MT_RXD1_NORMAL_CM))) {
 		status->flag |= RX_FLAG_DECRYPTED;
 		status->flag |= RX_FLAG_IV_STRIPPED;
@@ -277,7 +280,7 @@ mt7921_mac_fill_rx(struct mt792x_dev *dev, struct sk_buff *skb)
 		u8 *data = (u8 *)rxd;
 
 		if (status->flag & RX_FLAG_DECRYPTED) {
-			switch (FIELD_GET(MT_RXD1_NORMAL_SEC_MODE, rxd1)) {
+			switch (sec_mode) {
 			case MT_CIPHER_AES_CCMP:
 			case MT_CIPHER_CCMP_CCX:
 			case MT_CIPHER_CCMP_256:
-- 
2.47.3

