Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092249;
	b=2v25RIsyOL/lD+le/Erld9pgDEBgxwZq3la9WBNmhf2a74C3KFbRxXzRjROGpArZjYfz
	 OMmw9BiEHV2REOeMV9LWIQLSMj1XTb4gESuEvHvZR++HkB9wJvKCedrlQjMalVFSyltmB
	 EsMQvlmv7n/pB8kDnJcvrzfm+irifQZuxibhrI77rbJFt8eJCSXsjI744T2SJTHxcI6BW
	 ZHIRkm0QXoavLEJpQt42h4QqZxp7AGdJgKWOwIIBrjbmy0j8TNQ4B6MpL1VUZdP4QI8r8
	 lWCzqT7RBC4iiBWKkLGDrWU+kzTuMtBjC5X7yNO5NMPcyltiMWI+mrxS8PGouMB/dbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092249;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rIOv6ZjeRs/KXqvbo0N2ZK6534tkuIELU2jRwlsWCpQ=;
	b=KZT4KVqMyIg7UKJ2cYDywlaza0TC4M+rsOAA63U4ivQJiM8mMOCT1F8hytcQcoqKKzbC
	 gUt89dVt7JhpLrhkmYpA51oBW7fl3C5QgGD7BldEgP5CqpPKTAPsy0yveXqY3thjuicZ8
	 yokDzJ555y8zOSCa9A/ISsA3ic91I9K4rEPxeflMSG9FDjKh0YoMjlAZRu0RQwycUwSYJ
	 diBTr9PHAZJOjSujs1Q6K74B97xG9EISAXm5AtqECY5WFRzTvQyMD1w0fVXsDL/s5CSg4
	 rACG8C9v/wUdukeR0vSQwnJoEKcq927Cg/MWR34DuoIyxkVqFIwyn8CwcOJTiPd1+Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rHSABn7E;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07760A2602
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E07760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rHSABn7E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rIOv6ZjeRs/KXqvbo0N2ZK6534tkuIELU2jRwlsWCpQ=; b=rHSABn7E3nrFCMtEDA+z8H9A04
	UUe9fBkmByZyTNnz3L+KonUSUUEZVTUB8xoEW7NnXWMb+XOkIBbiLXpWU0xo8Ph8irEd0zGWcFx31
	XxXlLZPWudhkHmEzpwaxj748hHTdOkhjjhurJ2KHf7nkv//tFpaMH6n7CcgpmA6T3NSU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Ue-005VJk-0D
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:00 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/20] wifi: mt76: mt7925: skip the ND offload update of a vif not in the driver
Date: Thu, 19 Nov 2026 13:43:34 +0100
Message-ID: <20261119124352.1842164-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mac80211 also reports an IPv6 address change of a station interface
that is down, whose drv_priv ieee80211_do_stop() cleared. For an
interface without MLO, __mt7925_ipv6_addr_change() then queues the ND
offload addresses for bss_idx 0, which can be the BSS of another
interface.

Skip the update while the interface is not added to the driver.

Fixes: 9f8f587cab69 ("wifi: mt76: mt7925: add link handling in the mt7925_ipv6_addr_change")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index b88d92f9aaf2..0e26bfa75143 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2081,6 +2081,9 @@ static void mt7925_ipv6_addr_change(struct ieee80211_hw *hw,
 	struct ieee80211_bss_conf *bss_conf;
 	int i;
 
+	if (!mvif->phy)
+		return;
+
 	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 		bss_conf = mt792x_vif_to_bss_conf(vif, i);
 		__mt7925_ipv6_addr_change(hw, bss_conf, idev);
-- 
2.47.3

