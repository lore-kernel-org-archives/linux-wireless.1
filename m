Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262971;
	b=biabSQaJhGyTm8/ojIwrYN16JfGWj1Hj62BcBAiIOZEo6hDWcb/43Ms3lQ7BwMhQ3ScW
	 HOiUpjSfgtbYVCywr5Fc9T6W85AqUSy6N0Sjs03WuW1ZU/Z1JJDNTPCdVV/37MvdFUtDw
	 TicGbi6R/h/zw9cFUQhErMkMdyBU+4/Yb6GwfraEo4u8vhMczzzdash9p1zkTHQgEgOhp
	 J9p9wPxO01LD1NNR9XHiy/J4QDYgE/vIH95PlYLOro6B/j9mpfhaz2tbI5/EeBiWZr8q6
	 oi+MM6S//PLUGTnmiDgiouoSJYTPja8f1wg/eAbuPlM+hPuO32Vre0arzdBSG63QD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262971;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Odn1hhrudssRWVJmL1Uanpdq/PhnTeCdJoe7OqZmVWM=;
	b=qEoDPFT1VYWuZE24MgG7HwHwQpZfestdOLKmoB+TNKD23fPttuolo4u75YZgwMEfu+z7
	 ffvgUK+9OYUHJLpSlMR3a/kwd/KE2x6mwi/8p2USPvf9wWVjKV4gFyhBrfa6rDX8cU9WK
	 Xky5NQ1EyJ9b6YyaNEcw+yB29piCOvThpTxfXnX3wTKbtnCNLYui/4N49WgQp04Oe+GqF
	 Lqatwjthgh1pInRd3QEmq0AoK6zDxE+4AE6MfzagRZOlI8G/Ar3l23Hx6qmE2r51hTufH
	 gqydY97yX4vmZ3d70zlb87pyoPGb5DxlLtqN1TmjKJivgbdsfE8+b6GY2g2igl8cTag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=a0JlwzLU;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE12606A684
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE12606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=a0JlwzLU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Odn1hhrudssRWVJmL1Uanpdq/PhnTeCdJoe7OqZmVWM=; b=a0JlwzLU4UayD4i7TWvtutv39B
	bEb2/q6kUuTFFTWX5V27SvrLctFlhBIznpQjgAQNuEJumDXrqMwtm2D94zWLml1JvRtwLuYtPrYYX
	Fztkl9sZjc8qp1ust6IcO+R5q1hVnAtS6GKBrO3xO/cJMq0XpxsLTaSbTyn5xQcFG/qc=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuL-006Q1I-37
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/17] wifi: mt76: mt7996: send the Beacon rate table again after a full reset
Date: Sat, 21 Nov 2026 13:09:19 +0100
Message-ID: <20261121120926.3603979-10-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121120926.3603979-1-nbd@nbd.name>
References: <20261121120926.3603979-1-nbd@nbd.name>
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

mt7996_get_rates_table() sends the Beacon fixed-rate table entry only
when the rate differs from phy->beacon_rate. A full reset reloads the
firmware, which then holds its default entry. The reset keeps
phy->beacon_rate, so the Beacon update of the restart sends no entry.
Beacons then go out without the duplicate TX mode on all paths, at
lower power, after every full reset.

Forget the Beacon rate of each phy at a full reset, like omac_mask and
rxfilter, so that the restart sends the entry again.

Fixes: 254ab81f3b82 ("wifi: mt76: connac: add beacon duplicate TX mode support for mt7996")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f4c4ca10527a..7873b87c74d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2527,6 +2527,7 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 	mt7996_for_each_phy(dev, phy) {
 		phy->omac_mask = 0;
 		phy->rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
+		phy->beacon_rate = -1;
 	}
 	dev->mld_idx_mask = 0;
 	dev->mld_remap_idx_mask = 0;
-- 
2.47.3

