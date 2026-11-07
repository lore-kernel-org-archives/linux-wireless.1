Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=152.67.88.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092867;
	b=PUbpRj+eUQjXLst3V9RKrsV8yiDWG3jDlZMibIyRHavFoo6/sNNLpQx5WGI7rWP2V5KH
	 yohHhaM/oCiMd8pbkc5j1+mxyeqlhL6Z4Pw88tzH2b0O7dl+R058sB1C+tnAxvVUkeThf
	 hj+B2adJAy3Llr5A7w9FuptErjf5V49h3cfmV0IvJiztIFhGCYHbdsPBzBdOcUbrX/1t3
	 5G0JUPxWjT4nPW4oMcOPOLXlrHAOeop6cpacqqQqE130Ks6Teid1FcxapwPpaevp65kqa
	 lf6j6m/PZo/vsuL8TMFEwwh7zrPtyNxsl1KdLDBQl4rrVeT+iAJIb9Lo1VsJHaMi7pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092867;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Message-Instance:
	 DKIM2-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ucm3UM5QnHZw24/YYB+24dHQwHtnoOrs50wd4vOlRQ=;
	b=SQb303i47PcePhLCVXjsM2H8OnXf7XklCDVobMQV+8xKCLqT8zdR0OfvAnPsvATbREuE
	 FrddYw7wI5l/xAfabu5T0zpbDo6NIu8fBbdFEbZkgYsEo2Xkd7ZQzPc1g4ew2TFXYpQW1
	 fgjwipPbIrAYkPdxapNpqB0vvj3MpvCnaUkL9Qplhuh3qZ3Ygj9+A6y8FJchocaD+iZpy
	 qcSnHsXWnAIpKt67bEzxXBHMVfn0aJYve0Thy0yewj/JxYbEW7C/SbnOXFvKS5tdqA+jo
	 g6WyiGZoNM96yq2jqxZsNXyBBD/Q9rbtCoCSATVNzSlJ8pw3kYsY2Ft5O+MxPnsfmLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cubiculum.net;
	spf=pass smtp.mailfrom=cubiculum.net;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=1l1PTi0H;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b="fto84F/V";
	arc=none smtp.remote-ip=152.67.88.11
Received: from mail.cubiculum.net (mail.cubiculum.net [152.67.88.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B7F606A326
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 23:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B7F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cubiculum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=cubiculum.net header.i=@cubiculum.net header.a=ed25519-sha256 header.s=202501e header.b=1l1PTi0H;
	dkim=pass (2048-bit key) header.d=cubiculum.net header.i=@cubiculum.net header.a=rsa-sha256 header.s=202501r header.b=fto84F/V
DKIM-Signature: v=1; a=ed25519-sha256; s=202501e; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794092845; bh=3ucm3UM5QnHZw24/YYB+24d
	HQwHtnoOrs50wd4vOlRQ=; b=1l1PTi0Hv2TXSFQXDwNzCEWG4AiOpd6Se4LDcLQN5dQzopWtiy
	p8DVbaUys+DSqElO//mtdU4PRcoTTQ3K1GDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202501r; d=cubiculum.net; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From; t=1794092845; bh=3ucm3UM5QnHZw24/YYB+24d
	HQwHtnoOrs50wd4vOlRQ=; b=fto84F/VjgvmRuH4BgPYx53kNMATCT7C/oKP7t1L4L6CZhz9d5
	Hf7lsxzNZrRl+Wn3i0NCiu2g6FF60uX/IfH8bJQwxY1ocpyoCs/5muNNp6+ZFifd9pT6o/Zlznd
	jaAL+fxwBBAZMZmg0lyXSUzZSyzlAGoFtocebI+2rTTxpGuaqyuY8RP2uqPM/caxNNR/JrEfFht
	DjZObRmcW8yNibHCOcioqkH5BnO92JTHAMug9I6vgPCdskvyjBXdPCqDKk1CbrGAmS0LZIUEVM1
	fsjn8e46ZrZUfd5QWkyKrqqaFyhEv4zIzbOGFFJp8zw3xTJOHGAWJJhApIc+E7Ez8fA==;
Message-Instance: m=1; h=sha256:gIXCwk5Rbqt8D5ihejYgxnd7Y3IsqBSPiBrM6WL8
	st0=:ybFAEQdWA9SGqPDrsPN5kvMsjNUTq6C/UruK2xI/G5Q=;
DKIM2-Signature: i=1; m=1; t=1794092845; d=cubiculum.net; mf=PGtlcm5lbEBj
	dWJpY3VsdW0ubmV0Pg==; rt=PGtldmluX3lhbmdAcmVhbHRlay5jb20+,PHBrc2hpaEByZWFs
	dGVrLmNvbT4=,PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=; s=
	v2-ed25519-20260926:ed25519-sha256:UmhstsWs9uceVe0OyRbGu4Nzz0iz58YkDljaDgSB
	nc8/3ExUAyNdJiMy9J1cvLGV1URcvW6j8n7w7k4z4d83Dw==|v2-rsa-20260926:rsa-sha256
	:PbL5CUFdp9AO6OXWuAAgpW54Sm4pl/8nks3A8yBr9PweH/GWwkVSFUyCm6vUNkAX5rEA6ylV
	Z1NovJVuQM9137NXBjzyiopxJ7z16HD6o4cJnShHE2clAA2egDBB0/ID4BY0yqD2XjV/OX+p
	OWYGbcQSvVaf3AzXZfdg8r8KHd0DQOIxzShsDdQnZhcqdIlXRvVIDytX0I7xyg+qTsig03vy
	JfGEWw1r2p/BWV6kd2xqXcPANXC78GG0HibRpec8pH/IZsibAIK1qYnKXooUY/6Xqc6BDJV5
	9vsotecuCsQk9IKR8vrwJ5e24iPkVuQmnCEaryLn5nbIuGoEWpBdxg==;
From: rcfa <kernel@cubiculum.net>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Subject: [PATCH rtw-next] wifi: rtw89: allocate rfe_data with kvzalloc
Date: Sat,  7 Nov 2026 23:07:13 +0000
Message-ID: <20261107230713.3675421-1-kernel@cubiculum.net>
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

struct rtw89_rfe_data holds the TX power tables from the firmware
file's elements and is 1190784 bytes, so kzalloc() asks for an order-9
(2 MiB) contiguous block. On a host that has been up for a while there
may be none, and probing a USB adapter that is plugged in then fails:

  kworker/12:1: page allocation failure: order:9, mode:0x40dc0(GFP_KERNEL|__GFP_ZERO|__GFP_COMP)
  ...
  failed to recognize firmware elements
  failed to setup chip information
  probe with driver rtw89_8922au_git failed with error -12

Only the CPU reads the tables, so allocate them with kvzalloc() and
free them with kvfree().

Tested on an RTL8922AU (a USB 2 adapter) with the out-of-tree copy of
this driver (morrownr/rtw89, which carries rtw-next as of 2026-11-05;
hence the module name above), kernel 7.2.15. The failure came from
replugging the adapter after 16 hours of uptime, when the Normal zone
had no free block of order 8 or above. With this change the driver
probes, connects and unloads cleanly. A test build that always used
vzalloc() for rfe_data, to exercise the fallback path, put the tables in
vmalloc space (1196032 bytes in /proc/vmallocinfo), showed the same
debugfs txpwr_table as the unchanged driver on the same association,
passed traffic and unloaded without warnings.

The problem was found with Claude Code (Claude Opus 5.5) while testing
the driver, and this change and changelog were written in the same
session.

Fixes: 5ee7b2ea07cc ("wifi: rtw89: load TX power related tables from FW elements")
Signed-off-by: rcfa <kernel@cubiculum.net>
---
 drivers/net/wireless/realtek/rtw89/core.c | 2 +-
 drivers/net/wireless/realtek/rtw89/fw.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 58ee5efc3b5e..ec5d47cfe2ef 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -7730,7 +7730,7 @@ EXPORT_SYMBOL(rtw89_alloc_ieee80211_hw);
 void rtw89_free_ieee80211_hw(struct rtw89_dev *rtwdev)
 {
 	kfree(rtwdev->ops);
-	kfree(rtwdev->rfe_data);
+	kvfree(rtwdev->rfe_data);
 	release_firmware(rtwdev->fw.req.firmware);
 	ieee80211_free_hw(rtwdev->hw);
 }
diff --git a/drivers/net/wireless/realtek/rtw89/fw.c b/drivers/net/wireless/realtek/rtw89/fw.c
index ea7dba077f5d..55548bd82498 100644
--- a/drivers/net/wireless/realtek/rtw89/fw.c
+++ b/drivers/net/wireless/realtek/rtw89/fw.c
@@ -1283,7 +1283,7 @@ int rtw89_fw_recognize_txpwr_from_elm(struct rtw89_dev *rtwdev,
 		return 1;
 
 	if (!rtwdev->rfe_data) {
-		rtwdev->rfe_data = kzalloc_obj(*rtwdev->rfe_data);
+		rtwdev->rfe_data = kvzalloc_obj(*rtwdev->rfe_data);
 		if (!rtwdev->rfe_data)
 			return -ENOMEM;
 	}

base-commit: dc16902cad9c6b08df9395a510c7be44fbab545d
-- 
2.53.0

