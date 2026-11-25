Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628187;
	b=s8kEHs6nR9fLhyhgWeNr7/vdbDl/XD4R2LIS4KCPxGxEqlJJrJmcDWX0JP8xBSKOd8z7
	 o/5uYglFyq8BVu87zLU9ya7STrADq0IHwzg4A8LblLGHFdivK5QPu5gSu8y+HFItzrtNq
	 2AiyRc033Xx0lsuCsDhUgqDTlwrwn4+J1eQZBUsik4RaZY0qZtgFUPtbkVs4BbCm3OGDg
	 /09eWcsk2/gHFYh58Q4UHNeze6NS6tNJona6FoUpgtp9Ra2PbyUZ9sZnohyDJBI9qxaMD
	 lG3ngMYb1vje8uw5uyLpX92WrqctKEXuVMujUZ6KxKTai5VdZtHz+9/SUwOipgQ4ACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628187;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+DtApF2scB6MNHAEUuEA9dfYND/6fpePNkQXCETb84w=;
	b=H0xOWL7iV4L1WMxtGJd6yaWQSGLqWvbt/d5TmuOka1bwciW7EZOnjuB6inC0JSMqASZr
	 LYjDjk0NLNTiDHuif2pWXXCQDD1aiGdc1jq/wpz4SDjAGUu/IlskHODtJmmDf9JzjKvVQ
	 LiX8k3ygX+nmyGkem1ubjQNTNiQq8qSq1af3Bl4+qwzY2HMPzG3l95w8t3eTTmsG0wxrK
	 yj13ML2hsEkLJ/xSS54vTHuu0et27XeHwNMIdjNO4yUc726hQUsbeZGsjeg1cOa3murw1
	 qvBByPszX4EAbHrgdmeYT1Qg8MXzz48+k5YOrUmWBbNWZuwmXIsZu5xfrmXPErGS7Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=s+zcReZA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F22606A326
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F22606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=s+zcReZA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+DtApF2scB6MNHAEUuEA9dfYND/6fpePNkQXCETb84w=; b=s+zcReZAWniBJq2bi+9PW2xlBA
	rGEIzwMRW3BIKOzphLv6Q9oimc9wIlbiUSXKxk6V0bxcVm1kb2mALZEAEGbM1oKx2dZMiBme+QL1Z
	bhmrdfuOlV/SxnF5RmYio+WRoTxPQ1A1Rq8n9RusgUs8RuaDmG/L2lBkc5tBNQTd6mVg=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuv-008IWP-0r
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/18] wifi: mt76: mt7925: keep the RX PN state of a station across a rekey
Date: Wed, 25 Nov 2026 18:35:59 +0100
Message-ID: <20261125173616.3776951-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

At a PTK rekey, mac80211 removes the old key before it sets the new one.
mt7925_set_link_key() clears rx_check_pn at the removal of the old key.
Until the new key arrives, mt76_check_ccmp_pn() thus skips the replay
check for a frame that the hardware still decrypts.

Keep rx_check_pn of a station until its next key, like mt7996 does.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b7348e6f0290..c26d9982650f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -804,11 +804,11 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	else
 		goto out;
 
-	if (sta)
-		mt76_wcid_key_link_setup(wcid, cmd == SET_KEY ? key : NULL);
-	else
+	if (!sta)
 		mt76_wcid_key_setup(&dev->mt76, wcid,
 				    cmd == SET_KEY ? key : NULL);
+	else if (cmd == SET_KEY)
+		mt76_wcid_key_link_setup(wcid, key);
 
 	err = mt7925_mcu_add_key(&dev->mt76, vif, &mlink->bip,
 				 key, MCU_UNI_CMD(STA_REC_UPDATE),
-- 
2.47.3

