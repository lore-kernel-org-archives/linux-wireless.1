Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=HOyrf5J1tWZyZg/ZXjC+UD08uJywX4f4noOM6A5fBHwx/1cmDHdlaj+1C4TEBTme4eFk
	 2+EswA1TAwkJEnlHaiP4kaErX5ETt0q1VV2km2+5dvp2pa6WzynIvyxFTxkhLsdsv8dNu
	 2Lk/e8c2s3rU9QHa3GhdNnhAXAzXy/Im6Vk1RMTEvTrT13gOpoJyVhsm0C0Snq67gWflG
	 NVrWTC9yfQ4Ll9i6EBMfpHYm2eieppOGGGsLtUZLmAP7re3mGzsmDHglapJT7T7FFu5Bd
	 AxuHyZhFjv7BVHUwg+tgruT6uggMgHhQ+pmNFxEtV4V/fhhsXSvrKpmEOZ2/VUCNhPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3aEpFCbxTevgEs9qVBe2CaYndn+YyUGN98JAv4XWHJo=;
	b=q0N4fECwp89IWxPxBvEV27pa7EHT69EJpA/BqykmxacPw/pDOscVnr4HGXGdxI9LwncH
	 3mnjgg/iJr9lU3LbOk2HIxhbgkTIqXP4E4SdVqikCcUWwvNn7IXUauNcn87185ZDB+ofH
	 X4HsOMqFkozRuJYlRh1lHHD9M7PJOLD864omYMjx7XPU3fLC5/r6g6YbHoQJBKEWoZOpV
	 PmXrsHERbgEdB2yjtW6xqkNtbQmYwECfUYnqeF3GJSnEb6iZ/Oa9LGrYO9AUj7GjCHFRr
	 JoQS2AQOKKzpkMkd/HBibjIdOFFFOMVZdasrxukK5eqI2FtSiOBk1HbKF+Vavy8qWTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=NHYUfQwV;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CEC606A32D
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CEC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=NHYUfQwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3aEpFCbxTevgEs9qVBe2CaYndn+YyUGN98JAv4XWHJo=; b=NHYUfQwV3uuGBVLOWO6A/ZwFqE
	I1X4gLumU2Ehihu6WPCzWh2F92ISlEw5QJbMeFFC6nMtnyZQOwn4UAc5arnoQhqwItqPB9Qk4X/df
	jfQTlDre71zF7I4EXv0ofYkJNYf5VJeJ7T0lu7WBVbNatgObOGguuNmYKADjBe/02eOg=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuw-008IWP-1A
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/18] wifi: mt76: mt7996: hold the mutex across the thermal protection store
Date: Wed, 25 Nov 2026 18:36:05 +0100
Message-ID: <20261125173616.3776951-7-nbd@nbd.name>
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

mt7996_thermal_temp_store() sends the disable and enable pair of the
thermal protection without dev->mt76.mutex. The pair can thus interleave
with another hwmon write or with mt7996_run(). The firmware
refuses an enable of an active protection entry. A temp1_crit or
temp1_max write can thus leave the thresholds of an earlier write in
force.

Send the pair under the mutex, as mt7915_thermal_temp_store() does.
mt7996_run() already sends it under the mutex.

Fixes: 6879b2e94172 ("wifi: mt76: mt7996: add thermal sensor device support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index e82bc9cbc59e..f05231ce81ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -156,9 +156,8 @@ static ssize_t mt7996_thermal_temp_store(struct device *dev,
 	}
 
 	phy->throttle_temp[i - 1] = val;
-	mutex_unlock(&phy->dev->mt76.mutex);
-
 	ret = mt7996_mcu_set_thermal_protect(phy, true);
+	mutex_unlock(&phy->dev->mt76.mutex);
 	if (ret)
 		return ret;
 
-- 
2.47.3

