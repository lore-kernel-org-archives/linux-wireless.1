Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490796;
	b=2ihTblnvlRPbqfYA7xnlsKSvW1GDVQg/qK4HrvCAx37bPT5xqMubS6RiKi5uq7icq4ds
	 aYn5gk4XhwfRYW3Cc7iwwsIGQsbV1R5+i9jf4HBxzz684U9rnXiltXFoRiZO0TbvCQVAm
	 E03KAv6/3h/XQinsaDcL/X+TYXP4So+rf7Z5EOwOqhpzNEEFzHSkAj2naNr9zgxxS6ZTL
	 I50DAoBaP59olb7hOjlO5WYDyxpe5uMf7ervljqSD0YBZ9rkgX7Kb2vYhNXTB5Sbh0chs
	 7hOPTwcnIlhl95uCXVvHIz69SO15/lWZu+zOlao/ePawC92sOSKhVwfaJ1Y6+22x6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
	b=YTa+A+Hvj4Kmn5k6UN36YDy/Z3FceCR8dAprP4ZjF0j3Pl0boMsGHkwiz+yRxdH+uend
	 K4MzmHHrrDZvrQ2Xr0WvZ7rUUz7BQdTBvROFugoZXV6hqvFv0g0i/A+i/6QZfmTIqMlk8
	 jOXv9AMqgN//Mg2j34vhQ1Qur4go/lNjxGgJQJLd/38xILeo71EmBYNFQFEqdu1i9B9O3
	 x/ceTuVdy+6UkimtLzqfOUyiEClfayMtiAddmoDlyIXKxhyJrZBRc2UOelhMYvsWM+Wr+
	 Suyc8GzKnQUm2w7qT4d5p9njxIhvnwuJ1cQqKs/gz2DsHE6CMCmRwGymfL8wUw8j5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BJRYcCaz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04966606A33E
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04966606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=BJRYcCaz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214af2076so32673045e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794490794; x=1795095594; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=BJRYcCazv7TcWMeW5VaDg5GiMEt2ICDbqfTH5xn2VjEDibc6O/rn8lTxMgAoC2W1AT
         h5R50DLodlK1gFxfIHNcnJ04ZsvhhiLiDr27bjALZqteuvqLyn1x6jchmigUqPAHD6pw
         ITsLuzHNhejyIZ4GwuczyXOhRA7j92W25HiUcYZWNtynDSDSGVqAqaQcbkyHR8FhGXBI
         kxpapwY4PWlhS8vKFlR9HzI1Nqd5FRNkaJYoj5fzL1HbfOLCugSaM9jvVtb7lajP+x+b
         41x40WEsKIJHmOnXHgKhdWU9Rxsc4R6zD1yhjEWfHL409PyslfIb0eyqpYDkwYFLcP0k
         CzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490794; x=1795095594;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=LLyzU4qYd+SUczZliC6sPsDJylj+uClg0nKVznZfa3rD+zcDGKDrJNv+L4q5iw4jSf
         MMq4e0VHDZ0xICkNt9AEH2lQi5qiUAcNakXLuTvFIL5AQFfJumckgyQfi8EkmLCNbu71
         veieh+EpDx8SvlxycVeB/vQHofxs3b94sNwsczyn0+R94jjexbUwHf4SWOF1IUGRPQgQ
         vThrVhG+u3ncmnrESWafzfEes96C4eCjLTSFecEkXYqsCof0y73vHbmtZZuvSBUGBOnQ
         BJOlblGxy5AZ+BMFLxbRC0J39nTrB6y6BmXjqB49LX0pjORmewENmomGYWuFa3ksjtqJ
         kxJw==
X-Gm-Message-State: APuU4Z9QpAIrrmJxOAyb6VOSRgbMZjvRqmQ7PFy42IarSi2X7+baGvcR
	twlqCHYdyzJXXcFfIpB/Ui6jscEreGuPrqb+PsBRbWJeMCHkTNoAPuzBXJ4FlHYA6jM=
X-Gm-Gg: AYBFou3bIS+Pu02WFnrn8QV9/Cr/FQYge7ninlcZNCxu+qy/mIWKNYF4W0yXp62kaJ+
	U1OQf6FossTULdZvVtKsKw+Xnq29tVZMCu5X163i9TlP/CmkARmEPF+WkAi89O16/DlSoqWm7bB
	iHrSyBVrZxjTIN66X21pWvCztzR4hsvVfZRJooSshhydaEEKAgNPOqoP5Jtto3IWJpV6hlzKeAu
	i5ru5EQx8EyAG739Lt6Dm09KvJ5238dXjQ48PcICq8ofwm0Sc3dFG7J/IN0Psgut8pHcYoxDOq+
	ZZZ3J5NwnJcaF6rdJ6Ik13IMnk2Jr93nyx6Ccre+qptC2J6hxqZbTIsugsI5ZBls9yUfYe/Fw4j
	aQULqvw9lxyIEyPXEePVsev+pkszaO2Op+nm4ifvh8Jqm8yFR7LnViUhzIBJHmgLobM9dMqhTjc
	dXXa6qQg/tRAr8MXJOpE4jpgc7cxESFclqws/zw3dcWfetijQvQlfx9Z+4oeEyhnpM+27IRHf4T
	qc4Hmns6RTCDbRZFYY0OMonjSaJiVO0tQLfDUglZ4v7dfXgxdBY7Emv2MmcOGcDGAW/B/qGdBxI
	/EbxOL3q8Kon1tdTRRXCG8P21T5JBhxG+ZETgi1cDx6NhvCS/cILvW0Q3G6vswlIUGj3XWG6JyR
	WBN2TqJm2cA==
X-Received: by 2002:a05:600c:350b:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4ba09381815mr103259415e9.27.1794490794383;
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16920643f8f.46.2026.11.12.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:39:33 +0400
Subject: [PATCH] wifi: mt76: mt7921u: Don't reset the USB device on probe
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdPElkyHr0I4uFG0JoBZhzEhv
 LtTjt/h/zcwSSoG12qDJG81XeYCqiuIj9t8F9ShGPjEZyJinPKlZVoxZExikrFp2PuR2+idg5K
 9koz6+S+7/rCt4Skx/z6w719iTb5JdAAAAA==
X-Change-ID: 20261112-mt7921u-bt-reset-33288f29c855
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245; i=alchark@flipper.net;
 h=from:subject:message-id; bh=bL8RpPYoSxUEiC5G0bR5mu2gXixb1LSpx/iep6yWC+k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9Pbhgrt6mzODDqpa1AcI8vMX9clPd5p0T8ZCc7n2x7
 eh0vXj7joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKY6VpSR4YpHVJWeiTaD1rrw3dzTQ2qnHJB+bV301oJh4tMCzoQiYYa/ApGuEpd
 lBdsN7G/ov652P2JZ3fTkZdhDPtOXO4wTPjgyAAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

MT7921AUN modules are composite USB devices: btusb drives Bluetooth on
interfaces 0-2 and mt7921u drives Wi-Fi on interface 3. Resetting the
whole device from the Wi-Fi probe unbinds btusb, which has no
pre_reset/post_reset handlers, and since interfaces probe in order, btusb
is usually still downloading its firmware when that happens. The unbind
disables the Bluetooth interrupt endpoint under the running setup, so
HCI_Reset times out waiting for its event, and the Wi-Fi probe stalls for
about 5s until the Bluetooth power-on work gives up:

  Bluetooth: hci0: urb 00000000c4b7b871 failed to resubmit (2)
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

Drop the reset. The USB core resets the port in hub_port_init() before
addressing any newly connected device, using the same hub_port_reset()
that usb_reset_device() ends up in, so the probe-time call repeats a
reset that has just happened. A rebind without re-enumeration resets the
Wi-Fi subsystem through mt792xu_wfsys_reset() on both disconnect and
probe.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 2fdecf239125..90b9bdf15e9a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -181,7 +181,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 		.write_copy = mt792xu_copy,
 		.type = MT76_BUS_USB,
 	};
-	struct usb_device *udev = interface_to_usbdev(usb_intf);
 	struct ieee80211_ops *ops;
 	struct ieee80211_hw *hw;
 	struct mt792x_dev *dev;
@@ -205,8 +204,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	atomic_set(&dev->mt76.bus_hung, false);
 	mt792xu_reset_work_init(dev);
 
-	usb_reset_device(udev);
-
 	usb_set_intfdata(usb_intf, dev);
 
 	ret = __mt76u_init(mdev, usb_intf, &bus_ops);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-mt7921u-bt-reset-33288f29c855

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

