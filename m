Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=z7BsjmpVpNTfxSCoQjO5WsfByHFrjauvjhJVapFlF+6epC5fd21g5WgcF0Pi5pIydq1K
	 dIYvmCvD47PXNnzhxa68Vi7hoNsa+5TsFN3qr5sAIIA+Cu5rfL96/oK6py6SI85JHssDZ
	 23zAbU0FsjjkRJ6oXWttO4j5RZzLRdbdDPjt6N+TXxrn1ouRGtsvAg3qwFOWqCDzQKvqI
	 HRVQD7LHo1B+DYtpNkiRzt78ENOpIYKL8cWy1uhlaXpPNlGJCtQEMjHhrXU4G4I6+8I4d
	 f+LhiGOFge7eY2t3gqBTg/wKO8Y3+i60ydOwTMtbO0TAkD4i6VmKiRitV3dANcmEZvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZNYSuRDGVR1ZD3rUFYeuppotIhc4Wc3IrBn0LFO1kSo=;
	b=kviIgo3G+N1qlCPs3viWTTeHXf1EEfCa/36vDH//iFPNXnhBpaMlx4G7Xfk2y9h/a3fU
	 6gtG11DKZ4N+8nMd1PjrBojUP0ml4zDzHJOrw9qlFZZL6Bx+uvUHM4MhVozS9RS+/DMxo
	 Ouk4vDwqR5nu2YHaJ0lo847/ZOl16qeFYJ7C6qjYgnE/QJohCE+500kRGMCwWBp0HcfEx
	 DDWJ6rC4Ms9QcxqCGOed7gr4vytXL4YQqaTpyda3aO1IcvW7vZYy0gPyBcxaS9+zLc0xJ
	 mEHDplkLeCRJK0AuwiptK/8f37OeAgEliFo624dxvWydQE/oHEI9cGZsMvfPzpi3FWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="SHYOwq/+";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD2606A683
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CD2606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=SHYOwq/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZNYSuRDGVR1ZD3rUFYeuppotIhc4Wc3IrBn0LFO1kSo=; b=SHYOwq/+kMgEjSn5z/ONVEvxgc
	L4Q5Ojoq9NjaQ1JsqF78PPHxebbGaNwApb+xp25nRHbDVcEYKwsS7EuKFePfgZ7ZZ636x0ZpRX0bI
	iMgevcta9znIgD9jVuDgxYC6QfJCw2+LToMN6ycnmzZ6Cul0UyF6qt2wxGOE1Y2Ao7Ao=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGux-008IWP-09
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:27 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 11/18] wifi: mt76: mt7915: reset on an MCU timeout only once the hw is registered
Date: Wed, 25 Nov 2026 18:36:09 +0100
Message-ID: <20261125173616.3776951-11-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125173616.3776951-1-nbd@nbd.name>
References: <20261125173616.3776951-1-nbd@nbd.name>
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

mt7915_mcu_parse_response() queues reset_work on every MCU timeout, also
while mt7915_register_device() has not registered the hw yet. The work
runs in parallel with the probe. The probe fails on the timeout and
frees the device.

mt7915_mac_full_reset() ends with ieee80211_restart_hw() on a hw that
was never registered. ieee80211_restart_work() then flushes a NULL
local->workqueue or uses the local that ieee80211_free_hw() freed: an
oops after the failed probe. Any command of mt7915_init_hardware()
without an answer gets there, from the PCIe and the WMAC probe alike.

Only start the reset once recovery.hw_init_done is set, as
mt7915_reset() and mt792x_reset() do. Before that, leave MT76_MCU_RESET
clear, so that a timeout fails its command like any other error. A
device whose probe goes on after a failed command can then still be
reset after its registration.

Fixes: 10f73bb3938f ("wifi: mt76: mt7915: reset the device after MCU timeout")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 73bbeb1b4a8e..8ac595779f88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -181,7 +181,8 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			cmd, seq);
 
 		spin_lock_bh(&dev->mt76.lock);
-		if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state))
+		if (dev->recovery.hw_init_done &&
+		    !test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state))
 			mt7915_mac_full_reset_queue(dev);
 		spin_unlock_bh(&dev->mt76.lock);
 
-- 
2.47.3

