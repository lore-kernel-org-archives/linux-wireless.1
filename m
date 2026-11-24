Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=e1oE3A7FXev2xZsDM0oWNInd+Px3i+5O8jEfQq7UjcqYHskGJm8yNBxTP/yoGrYDoQHv
	 /ARJLH9evqRcGP1jXrgevYlF4YE2L6nl1Man7O+lM/A5y3Kq87meJ9oJJMxZnOELGKRdm
	 YnebN31Bet3jPlrkbqin0/+kkazqdL+a7/DOBj1s4XwdczEv+exTRtZab7L2W7NilNgGK
	 lVP+DazrE5kSIaPkkfCRZj14711ZDAFbOvOMwaEnt60Z3TzOw1d+e8A4sw+0ZfThCFmL1
	 XY8RmtBgVIjXqm6DOAjk8Dl940Xwrh4Obk5smp74J8OzYsS4AXtiEy4DPTCmO2Tw/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/4P/yIuZMsQgoB6qjVTWIYZqyZNjVAZC4N4Jzu7N1PE=;
	b=qE4uEUN9GgP+yEf6E7y/XlP9fhvu2Mib4wmKnJ5f1MeLk9jIZ+6lmVJPhnvhMk/cmAgF
	 FRzgPCqdljC/0g34LxKSpp7SFhYW4E949ZT2IB8BvL4nQitAem5ij2z7ZaWZihGrwP/dv
	 SfI3i3pUbRMbulzpu0RCL5Q3n1183UVBAWT9SdjCayM7s3PycNXwY3Wn1xcn/ovERG0Q0
	 ohN2dau7lkDjPzn8TmwxIYnATvV3Dg/MIegiQNRZANbz3p9mpTF28Di0Y2ECYbtnnHGm4
	 wd7Gi0VYxm0wSA7bdfUxY1N85HFRWpjOQBRgPptaFHjwkU42MaAfHg5fXe15xcpJHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="j0D/h4ds";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5A606A326
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=j0D/h4ds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/4P/yIuZMsQgoB6qjVTWIYZqyZNjVAZC4N4Jzu7N1PE=; b=j0D/h4dsVUPLcDrHxa4kNjhEfK
	rdKFDATjq6QpJg0Hs2GRm11/Ya95VEWK6EaJ21b3192/IrScE+AAHfQV6eiqoUmOfe9vnMvdr7upt
	6gJkWasj0m1Kv+f429xBFdmP2xm4593lD0vQWwS4sSHrKf0l23GFgYsQTmxCrcRbWiGg=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7L-007dJf-1T
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 02/20] wifi: mt76: mt7915: set the LED GPIO mux of mt7916
Date: Tue, 24 Nov 2026 09:42:51 +0100
Message-ID: <20261124084309.1981968-2-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

The three switches of mt7915_init_led_mux() set the mt7916 GPIO mux for
chip 0x7916. But mt76_chip() returns 0x7906 on mt7916, like is_mt7916()
expects. 0x7916 is the PCI id of the second interface, which
mt7915_pci_probe() hands to mt7915_pci_hif2_probe() without a device
of its own. The GPIO mux of the mt7916 LED pins is thus never set.

Match the chip id of mt7916.

Fixes: 9e81c2c7b9af ("wifi: mt76: mt7915: enable per-phy led support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 6d09718ec585..1bb2a938c354 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -612,7 +612,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
 				       GENMASK(11, 8), 1);
 			break;
-		case 0x7916:
+		case 0x7906:
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
 				       GENMASK(27, 24), 3);
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
@@ -631,7 +631,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
 				       GENMASK(11, 8), 1);
 			break;
-		case 0x7916:
+		case 0x7906:
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
 				       GENMASK(31, 28), 3);
 			break;
@@ -648,7 +648,7 @@ mt7915_init_led_mux(struct mt7915_dev *dev)
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX0,
 				       GENMASK(7, 4), 1);
 			break;
-		case 0x7916:
+		case 0x7906:
 			mt76_rmw_field(dev, MT_LED_GPIO_MUX1,
 				       GENMASK(27, 24), 3);
 			break;
-- 
2.47.3

