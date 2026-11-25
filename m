Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628188;
	b=B0m8I7SrTizNvQrrEaCIfzGUflWfXZqwI9J4CBqWLkJJTyoP9HSpQRnBOBXnXRKXjPVW
	 8ERE3VJpL84ZWSR72+jHeavO8hckJUFQjXpFrAJaAsOUBQWuLy64C+gEBLBtwuJhFS6jM
	 L03Tq7Lo+oArO1k0Wxn7SayAuPtbxT727CGWZiCG6747rhUxltIY5NE5VfV/NwcXnCPBF
	 lP3ZeRChKnokgLeymQYXHmQRuawD/fGh/mzdpm05DQ+ENbJqDffRf4l8GQIZo3plGEQAB
	 fY3klh8cPAIW9gN+m6GdXqMcSf3lDwN/Od3PyPkRneEXWO9zivMvLI8Fnk+TUFhmc5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pfjJPXzfb6QJqpjGNNLS0RAcT3iNCk0UuDA8tHsHksA=;
	b=YW8Z3z070sZ7OtDeAh/Rr7Mb3RVU71u8x3HAPZswtB2aM+Fu5K8QCb2Dy1JzTD+Iippz
	 /qF3p6kgvpUb9H17fSDgeWCHsTuH97b9qmJKCpZszRoquMAoMWBNhcMsFjSOARE5Snren
	 IlKKqLAe12Ob3LSdtNjrucWwL/MXrgH5uEa5+ITNZAealanhhRRHicjhz3b17KjKODhsl
	 4PaRjlKV1OZzVV7Ilg66zFKJrBU6Vn3PgZHNAa8FYc1RiJz3ToFP/5KH+ZGEPpKkMeEQY
	 fa+yMN2xZXIAavv5630ATGOkoGeixRXwPZjN7A6EfF9hVFERA1TZhm4oDbOCNQojkug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WygdTTxg;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA74606A339
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 17:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA74606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=WygdTTxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pfjJPXzfb6QJqpjGNNLS0RAcT3iNCk0UuDA8tHsHksA=; b=WygdTTxgL0JLjLGHrzs+ShzBVl
	oAGCbd/OPJtD6T6SI7ez3T1mVwq0VE41aiGICjaID5hkEDwvdIpKgeX9H8tE1EV+4oS78cdP+Isuq
	q8IxQfvwtvGtp+skKPStnC9zuge7lhIagpp+u0yZrR738rGWqhXPzNnIKrokrenF/ZKE=;
Received: from p200300cadf00a300521515e4a5376631.dip0.t-ipconnect.de ([2003:ca:df00:a300:5215:15e4:a537:6631] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWGuw-008IWP-2I
	for linux-wireless@vger.kernel.org;
	Wed, 25 Nov 2026 18:36:26 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 09/18] wifi: mt76: mt7915: wait for the answer of the background chain control
Date: Wed, 25 Nov 2026 18:36:07 +0100
Message-ID: <20261125173616.3776951-9-nbd@nbd.name>
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

A command sent without a wait can sit in the MCU ring when an L1 SER
starts. The recovery can then drop it with no answer. The driver keeps
a state that the firmware does not have, and does not send the command
again. The stop of the background chain is such a command.

Wait for the answer of the background chain control. A lost answer
then requests a full reset, as for any other state command. The
firmware answers it. The thermal duty levels and the thermal protection
stay without a wait, since the firmware never answers them.

Fixes: 39cdf080ce78 ("mt76: mt7915: introduce mt7915_set_radar_background routine")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index d3842268a638..73bbeb1b4a8e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2861,7 +2861,7 @@ mt7915_mcu_background_chain_ctrl(struct mt7915_phy *phy,
 	req.band = chandef ? chandef->chan->band == NL80211_BAND_5GHZ : 1;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(OFFCH_SCAN_CTRL),
-				 &req, sizeof(req), false);
+				 &req, sizeof(req), true);
 }
 
 int mt7915_mcu_rdd_background_enable(struct mt7915_phy *phy,
-- 
2.47.3

