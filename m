Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=152.67.88.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092785;
	b=0cWagqiWEsDdcrjP8OHsNiyS7R/Qw0gCIn1wFgp4Ze6YPqMJ4Gtei9QxBQQGIzZ9Hv15
	 LQBEaWZLbR1DLCHuhOXF3iYBtrstqjR1cikcc2MfkRQ0AP2tnK7BSq/4l77QM4zxn/wOQ
	 Kf9IWIKuibbWjBXuycCX6uF8/Stf8VoZklI8/qY5QDYI/0hf/WGSj0wMPUuEeJkfsRF4f
	 /3mJEBMncHlsKZ8KQYkyhkKP4ajsfLtkUgN0RxzMZR29R5+09nLpBdVz6N/hDrMS875p+
	 J/SZGssaNl5srwNY/ITmD0qZHONm5KRtwyob/dPYacU+c/Vv0lrPJSgHsl0HJJiHWDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092785;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-Instance:
	 DKIM2-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ZMIryuIoy5TWRrLbsdGxhT3rcZ1egQASgMMpCRimrg=;
	b=L/gflnyGwL8ZYhdHEvVMV+3lorO118dAYm4WztsLceA4avawtMOmW4Fth5srXoLFBr80
	 eV73n6HkaLOiWA+1aC0U431PLfmYODW3MksVJBLGUc3JqLPo2iZEjO5UJGg5qtsjbVWvW
	 ODXgIKzy9Cko2QihzJgRXh1MOYWvmBcSNrglE8Mtbq5CZuHb+JRMFS0HegcQMDHEmK8gN
	 uApJMz5cGwCiRXOpFsWBibpSbbR54pDUR0eZz1oieG8t8YLbh6lzUKpJ9EnFnxHks/r7n
	 aDeIJc6Nxo0ud5UmMoOPKEn44S/QxqogjT/GXiSORxETyvsKcOIA/Bet3xzQXT1BAvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cubiculum.net;
	spf=pass smtp.mailfrom=cubiculum.net;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=3w50GFHd;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b=KcOhcNmQ;
	arc=none smtp.remote-ip=152.67.88.11
Received: from mail.cubiculum.net (mail.cubiculum.net [152.67.88.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8106D606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 23:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8106D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=3w50GFHd;
	dkim=pass (2048-bit key, unprotected) header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b=KcOhcNmQ
DKIM-Signature: v=1; a=ed25519-sha256; s=202501e; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794092777; bh=8ZMIryuIoy5TWRrLbsdGxhT
	3rcZ1egQASgMMpCRimrg=; b=3w50GFHdbGsZGHBoIf8dqLRotuK30LvhM0fMwMI5MnBDDKjKpL
	IiM1k1O+JXrT8+DjwpcV2OZYglFBMB4unhAQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202501r; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794092777; bh=8ZMIryuIoy5TWRrLbsdGxhT
	3rcZ1egQASgMMpCRimrg=; b=KcOhcNmQhuaHY5lbHJ8tYbU6JfjK1FBoX28aVZq7+Laf95WHaG
	z/tISUqRmxesNnvt4tkWzvUTX9/+0ccEajhPKLEvv4rFBhCNtCLwhKnA+vY8NQl+lPrbI/cms43
	CLXJtvWpewfom1GnRysYwhHuy4hGYhAMutfSiQ+QjyDoF9coOb/YKV9XbdWFfkGZC8T+rrWmFXP
	lelUAiSS06jUrvg5WIDcuZjIlbbEQ/UWNSdjB4sk9Vu6awpTAGT5o590cO1Xdl57+CkTexoCTj2
	q0UCYfltmPv48h05wgX7ZQVo6CqIe4iqVSKzMX97K4LEJct2KUJSPPDZD7cSLYaERlg==;
Message-Instance: m=1; h=sha256:DIvadXNveU4twWEbwoZw/Ak9G4riGbcqYWiTecDk
	haE=:tIgC3RyAhSA347UzseeyjGCvoT0EVgsbLTClVQPgIGI=;
DKIM2-Signature: i=1; m=1; t=1794092777; d=cubiculum.net; mf=PGtlcm5lbEBj
	dWJpY3VsdW0ubmV0Pg==; rt=PHJ0bDg4MjFjZXJmZTJAZ21haWwuY29tPg==,PHBrc2hpaEBy
	ZWFsdGVrLmNvbT4=,PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=; s=
	v2-ed25519-20260926:ed25519-sha256:vynExuGj1OWTQaMgTUgI1P6a2JrP4UxtatwbP+5R
	IFTM/AvM8nwGkQh+/CfIwtFoen0hGA2igI7wskI7Mj+eBA==|v2-rsa-20260926:rsa-sha256
	:aXrvxG4jhiJRBfdAKbaExt6+YdfbVFEY0Avbb/yJNb95SJobRd+DOA5OTKRsaYcuVnYis2vJ
	VsBm+3MSlQ1+WsbROjp+h36ta2n5zJw9Yf0qh3LKKx1Bqwb9R3cb4yhcMI4CxVjiUcAqQxC5
	YiQ0zM5Clzl8/DYHBWfHTjc82v/XdzyLkfezhtuy0Medq19j7LM2tKXV3PsdlzH1R+RhFSPf
	ntmNJLc65HkGIj6EprJrlOFp3RrOtvlc3Ldedc0+b8z4RE8WLcuxmVm1pv8qQyJh3aCw88oZ
	zwTTeGd+NEeqg3y+nRRbdlJxTVd6Is9Feg6mEHTnt+DJ+f6g+V79aQ==;
From: rcfa <kernel@cubiculum.net>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: [PATCH rtw-next] wifi: rtw89: usb: keep the endpoints until the driver lets go on unbind
Date: Sat,  7 Nov 2026 23:05:47 +0000
Message-ID: <20261107230547.3673679-1-kernel@cubiculum.net>
X-Mailer: git-send-email 2.53.0
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

When the driver is unbound from a device that is still attached (rmmod,
or an unbind through sysfs), usbcore disables the interface's endpoints
and kills their URBs before it calls the disconnect method, unless the
driver sets soft_unbind. rtw89_core_unregister() then still
deauthenticates, flushes the queues and stops the chip, but the bulk
endpoints that carry H2C and C2H are already gone. On an RTL8922AU with
an association, every unload logged:

  c2h reg timeout
  timed out to flush queues    (3 times)
  read HWSI is busy            (18 times)

Set soft_unbind for the USB drivers, and in rtw89_usb_disconnect()
unregister before cancelling the RX and TX URBs while the device is
still attached. After an unplug the device is gone, so the order stays
as it was; usbcore disables the endpoints first in that case (state
NOTATTACHED) whether soft_unbind is set or not.

Tested on an RTL8922AU (a USB 2 adapter) with the out-of-tree copy of
this driver (morrownr/rtw89, which carries rtw-next as of 2026-11-05),
kernels 7.1.5 and 7.2.15. Every unload while associated now logs only
the deauthentication and "deregistering interface driver", with no
warnings. A physical unplug while associated logs what it logged before
(the messages above), with no warnings and nothing stuck. Reordering
rtw89_usb_disconnect() without soft_unbind changed nothing. The other
USB chips share rtw89_usb_disconnect() but were not tested.

The problem was found with Claude Code (Claude Opus 5.5) while testing
the driver, and this change and changelog were written in the same
session.

Fixes: 2135c28be6a8 ("wifi: rtw89: Add usb.{c,h}")
Signed-off-by: rcfa <kernel@cubiculum.net>
---
 drivers/net/wireless/realtek/rtw89/rtw8851bu.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852au.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852bu.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8852cu.c |  1 +
 drivers/net/wireless/realtek/rtw89/rtw8922au.c |  1 +
 drivers/net/wireless/realtek/rtw89/usb.c       | 17 ++++++++++++++---
 6 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8851bu.c b/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
index 6672ebe68f17..e89d5dd05fc8 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8851bu.c
@@ -70,6 +70,7 @@ static struct usb_driver rtw_8851bu_driver = {
 	.id_table = rtw_8851bu_id_table,
 	.probe = rtw8851bu_probe,
 	.disconnect = rtw89_usb_disconnect,
+	.soft_unbind = 1,
 };
 module_usb_driver(rtw_8851bu_driver);
 
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852au.c b/drivers/net/wireless/realtek/rtw89/rtw8852au.c
index 1a2e5dfbaab3..ef34a56f4cf9 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852au.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852au.c
@@ -84,6 +84,7 @@ static struct usb_driver rtw_8852au_driver = {
 	.id_table = rtw_8852au_id_table,
 	.probe = rtw8852au_probe,
 	.disconnect = rtw89_usb_disconnect,
+	.soft_unbind = 1,
 };
 module_usb_driver(rtw_8852au_driver);
 
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852bu.c b/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
index 550fc4ac7a21..9c53bc686bca 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852bu.c
@@ -84,6 +84,7 @@ static struct usb_driver rtw_8852bu_driver = {
 	.id_table = rtw_8852bu_id_table,
 	.probe = rtw8852bu_probe,
 	.disconnect = rtw89_usb_disconnect,
+	.soft_unbind = 1,
 };
 module_usb_driver(rtw_8852bu_driver);
 
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8852cu.c b/drivers/net/wireless/realtek/rtw89/rtw8852cu.c
index 2e46b05b05ee..dbc2274dfc49 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8852cu.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8852cu.c
@@ -145,6 +145,7 @@ static struct usb_driver rtw_8852cu_driver = {
 	.id_table = rtw_8852cu_id_table,
 	.probe = rtw8852cu_probe,
 	.disconnect = rtw89_usb_disconnect,
+	.soft_unbind = 1,
 };
 module_usb_driver(rtw_8852cu_driver);
 
diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922au.c b/drivers/net/wireless/realtek/rtw89/rtw8922au.c
index b146bd79c675..c64bc1db1737 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922au.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922au.c
@@ -91,6 +91,7 @@ static struct usb_driver rtw_8922au_driver = {
 	.id_table = rtw_8922au_id_table,
 	.probe = rtw8922au_probe,
 	.disconnect = rtw89_usb_disconnect,
+	.soft_unbind = 1,
 };
 module_usb_driver(rtw_8922au_driver);
 
diff --git a/drivers/net/wireless/realtek/rtw89/usb.c b/drivers/net/wireless/realtek/rtw89/usb.c
index 8dc2c93e502e..435544165d5c 100644
--- a/drivers/net/wireless/realtek/rtw89/usb.c
+++ b/drivers/net/wireless/realtek/rtw89/usb.c
@@ -1314,10 +1314,21 @@ void rtw89_usb_disconnect(struct usb_interface *intf)
 	rtwdev = hw->priv;
 	rtwusb = rtw89_usb_priv(rtwdev);
 
-	rtw89_usb_cancel_rx_bufs(rtwusb);
-	rtw89_usb_cancel_tx_bufs(rtwusb);
+	/* After an unplug the device is gone, so stop the transfers first. When
+	 * the driver is unbound from a device that is still attached (rmmod),
+	 * rtw89_core_unregister() still talks to the firmware and needs the RX
+	 * transfers for the replies.
+	 */
+	if (rtwusb->udev->state == USB_STATE_NOTATTACHED) {
+		rtw89_usb_cancel_rx_bufs(rtwusb);
+		rtw89_usb_cancel_tx_bufs(rtwusb);
+		rtw89_core_unregister(rtwdev);
+	} else {
+		rtw89_core_unregister(rtwdev);
+		rtw89_usb_cancel_rx_bufs(rtwusb);
+		rtw89_usb_cancel_tx_bufs(rtwusb);
+	}
 
-	rtw89_core_unregister(rtwdev);
 	rtw89_core_deinit(rtwdev);
 	rtw89_usb_deinit_rx(rtwdev);
 	rtw89_usb_free_rx_bufs(rtwusb);

base-commit: dc16902cad9c6b08df9395a510c7be44fbab545d
-- 
2.53.0

