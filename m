Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262973;
	b=X8O6jvamdtCgb8a5FcGn/TWHxTmA0QllHqN7lLSXLEZYrr5EZqixe2A7dFXrAhgUIpeQ
	 IjwipztGHUazBu92FXB+fsPkCa2J+VUmZBFWDCM4cHi/uENlcNrcN0hWpdVqXHkgdDfGo
	 okg2DJH52hV00lPb5EOwBhJnZBLiZ0xDy7/iMzjVySgLq566yBQ2wnl4PLVKN4ltUmn+F
	 cGIeMBkNBQqbixiGIt6FqR46WdG9mycEF5FQSTV0E/dVFeisOk/eEb6WOf1EdkXjt3EOA
	 s2ukSKK3/E6JxfQEf4bROJxomLfWarS8YModJ7EukFqoGVfGk5oOFlyK3fmHWp/wR/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262973;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KyeBc7SyMSdcIuOukgJgILxlWK072X8S6cIDqcuWY44=;
	b=nLn6GimZmBtzWgRPUAB2W3/xDZLVUG8PizwqmZpMSi3N+V+ULLgQ72/Av8dTEoP3jTeL
	 8jrmhfSipNAVDJs8mituY3mOXo1EFTswk6n6ewDNQ6GmEoJG8q8BSOz+eLB3DqsgmK/Z+
	 TTzLVCS/SuiUeeS02DN+eSw5Ciiq8Il4JGwUCDvYK1Tfk7OSjoKLO/38iRO3RdpFMqV5t
	 fnqVZReL4uHmaqrp2BUhHI5jKmFXv86+SKHFwQIFrO1WWMqvQLf/Z0pciWpvyVz7YCbnj
	 Bft40kNVn5o2xdfroqH3j0X2W2qv2Xi64YfB7IYefzWSM4FwCQvVRq1MTABCOpYHeyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dAglHTI1;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D076B60A2600
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 12:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D076B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=dAglHTI1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KyeBc7SyMSdcIuOukgJgILxlWK072X8S6cIDqcuWY44=; b=dAglHTI1HjR24YZRTz0r4MzUxO
	HKRymRNAEbwpx5jWfYP3LObjWpl7uNG0ng9gvxtWE+T1c/UissEgYvut/MgosRdD6Wy/XUf/iVYsf
	hmFhKGTkh6QMIG16C9if1bdc+C/BT9Rcmw4H6HVOlUWpxSv+vDdt1AJvt0a7Dl2xtnYQ=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUjuN-006Q1I-1Q
	for linux-wireless@vger.kernel.org;
	Sat, 21 Nov 2026 13:09:31 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/17] wifi: mt76: mt7925: don't reset the USB device on probe
Date: Sat, 21 Nov 2026 13:09:26 +0100
Message-ID: <20261121120926.3603979-17-nbd@nbd.name>
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

mt7925u_probe() resets the whole USB device. On MT7925 modules that
expose Bluetooth on the same device, this also hits the interfaces
that btusb drives. btusb has no pre_reset/post_reset handlers, so the
reset unbinds it while it sets up the controller.

Drop the reset, like mt7921u does. mt7925u_probe() still resets the
Wi-Fi subsystem with mt792xu_wfsys_reset() if the firmware is running.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index ee5306c29427..b1f6ef35fffb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -190,7 +190,6 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 		.write_copy = mt792xu_copy,
 		.type = MT76_BUS_USB,
 	};
-	struct usb_device *udev = interface_to_usbdev(usb_intf);
 	struct ieee80211_ops *ops;
 	struct ieee80211_hw *hw;
 	struct mt792x_dev *dev;
@@ -214,8 +213,6 @@ static int mt7925u_probe(struct usb_interface *usb_intf,
 	dev->hif_ops = &hif_ops;
 	mt792xu_reset_work_init(dev);
 
-	usb_reset_device(udev);
-
 	usb_set_intfdata(usb_intf, dev);
 
 	ret = __mt76u_init(mdev, usb_intf, &bus_ops);
-- 
2.47.3

