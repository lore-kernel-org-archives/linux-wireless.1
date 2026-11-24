Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.42.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509415;
	b=ZgL0bQRW1nFEgxwtfkQpYbmdTGtv8SGFIBe/vGli1lrLym4IM2MhqBPQ+BUZ6BUOOHo5
	 Rf6F7MiOXDymm7WZ8s/TCELsejX1JO5b+N/BEDmiTzoZBgR+DNVncS7x+OIbr+AtxwBmq
	 uK7F0ykLEmbG+l288lNTtr2pjN55UaIu0gPAWq4E/Lsob96l8/Mn/40UgYufeTFQVZsHt
	 g7Mhy19vyDD43P/y8rwS4kKLmG/ATvUBf4CYkW3N82QMhzyM0nuc2Lu12PNAOBPftcKL8
	 4Vrt66DZngI/RHcFwwj8rtjzjAjzKNkk6CN2qDENnWeBaGl2vouaTootWNqwusrhKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509415;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-purgate-ID:X-purgate-type:X-purgate-size:X-Notice:X-purgate:
	 X-purgate:X-pfmilter;
	bh=hY+zeHIx/M6C9GplM3SSMVPogyQn9jbysYgMHbvj/zk=;
	b=Jaz9Y2XvIgTeF/lj72LHXLD8kA17M/d4paEwL5UBbtnpBC6olbzY/PcqweqsyPuw9wlg
	 ZoYmeFSRHnsl+8d3zFy1fVuXKt9RbvCXMO5CAzJWsj9ziNeTQrA5uSbPsGyYS5gGNDzEw
	 puwSl8DoG93vgqdnhKvVcyX+kndJ8m0Z8ntot01liNIiWbx0EgCO5XoJUowGS9j7aGcq8
	 GIctvPHF1cSjvQBhFHW2xknZ9jE5xUE/DFvPdLTrJyWr8fy7hIeSw++MkqQ4trb4rITBo
	 V2oEMzMS1mK4OshJ5slHsUei1a7rUue9o5CyX12tpTGG9nmnb89kSxCfuh0ldywdiIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fritz.com;
	spf=pass smtp.mailfrom=fritz.com;
	dkim=pass header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=FJDT2xWG;
	arc=none smtp.remote-ip=212.42.244.119
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20091606A33E;
	Tue, 24 Nov 2026 08:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20091606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=FJDT2xWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1795509404; bh=oxbfzJWttGTwZXBilbg4huLt/V+17xV0C78VuQnWVvY=;
	h=From:Date:Subject:To:Cc:From;
	b=FJDT2xWGwBJzTLjRBz7IkbrG26UmUkbA705z9mcGFzZBTWqIaRHwJb5HIzIO8QZs/
	 0QHExZlULL03qwDpPu/6wiBsw1/HpvGvcsyc2sFTqRj0qX+6x9emHjjXg93P5+Ae2l
	 a/mMd8B7KcFF2uPmALH7dTbXDASP22b1CoBIU/X1DDM7EalVJd76Q6IpPvs96zgsod
	 Caz4Ts5Ia5eAVw7BrYEKJGluqN18BZ7BzH6493A/kW3l9vr7WOf/ETh8/ghqx0N7A6
	 FKOsFGaYY+eAg35dxwZVwoXYi2uc6eKVm07rmYOfdpNuBhz33+aYNIumXx+WaKbstz
	 V/nyg9MToukTg==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6b054c9c-9684-7f0000032729-7f000001bb88-1
	for <multiple-recipients>; Tue, 24 Nov 2026 09:36:44 +0100
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 24 Nov 2026 09:36:44 +0100 (CET)
From: Nicolas Schier <n.schier@fritz.com>
Date: Tue, 24 Nov 2026 09:36:38 +0100
Subject: [PATCH] wifi: rtw89: Add support for FRITZ!WLAN Stick 6700
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
Message-Id: <20261124-add-device-ids-for-fritz-wlan-6700-v1-1-f1a23c5df0fc@fritz.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7ZgWGzBexbAo7VTHCOi0oJFwd
 4u4fPkv788QSZginIoZhCaOPPQZ9K4Ad7X9hZB9ZihVWWldHtB6jz6Lbl0ihkEwCKcPvu62x6p
 WCo2rjyoYa9qgIYceQoHfv5Nzs3Ec2xu5tJb/htBzzO9p06C1kdANXcfpVEz13qA4Dc2yfAHhh
 3TbsgAAAA==
X-Change-ID: 20261123-add-device-ids-for-fritz-wlan-6700-4c780f4a4bf1
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Held <f.held@fritz.com>, Robert Sperling <r.sperling@fritz.com>, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=oxbfzJWttGTwZXBilbg4huLt/V+17xV0C78VuQnWVvY=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBrBUybn1LWcAqASSRzHGv477skUQjjBBrYxTb66
 mhiWcl4wcqJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCawVMmwAKCRCIxryciJpt
 uE2SD/9emLhbTOWH6fwr1m316h3ZXKLBjwxGb12AAVtmUL9J6DahOEofaDASen0BkDzH2KXVRsJ
 Skq4a4d+UdnI7Ad1pFLhPauU9+2U4D40MOKKbd9h9BQYL2MC56JXnzm/dyxTmmb3Kapa+gvX/1h
 3plMbs86jpBo0K3VEiqi61P8KiJdcdsKubFKw46+bXyof4KUN3lxwq62q+4CR1YgKDwyxPwzr//
 8bVEMNNn+sviVbV8NwfoNcV3oalVEVlAiCA9da9/qcYJa4FuRVaZ5Vfs/PaOmll9YqmLkam7LOH
 mod7DGo4aDBbTQrYzd1XvHMjiVOxArRwi/VOQQPXAj+2YxnTNwvfhXTR7G2OYEwumLhAchoUaOx
 ZkinT4ucmd2RIhX8jS+rrsJkt1OiMWsrsPL26BZmlBqn4uTeqUTXSvgJTiUQFLL0V3JDkpJk0fG
 sKUVv+MNZCeArgj3q+DHcnUKMBiOjyDwBqJyeT0Mj+vkatCj93/gGO+iuLg96AeFzIs/sHgTn3X
 yGDF6MVXOtJKxyUd/sIzUj0iFCHdTF/b3utPFj41cvPPvkWuAtcZzAxqTNsnRED708aOlhcLuvD
 BccAIvabItTSWlt2YNy/9P/4HFhNx7/xRod9XcFJJ1o3qLwuGieO9mVjgutx5y4eLJBmR6hnHY8
 1/QIsSmbz5SFdzA==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1795509404-DFD8CB72-B6F8D590/0/0
X-purgate-type: clean
X-purgate-size: 1416
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 83948A0393  external: no

Add device ID for FRITZ!WLAN Stick 6700 USB-A adapter.
Originally added and tested via [1].

Suggested-by: Robert Sperling <r.sperling@fritz.com>
Link: https://github.com/morrownr/rtw89/pull/100 # [1]
Reviewed-by: Florian Held <f.held@fritz.com>
Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 drivers/net/wireless/realtek/rtw89/rtw8922au.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922au.c b/drivers/net/wireless/realtek/rtw89/rtw8922au.c
index b146bd79c675..4a2bc1b2037f 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922au.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922au.c
@@ -48,6 +48,8 @@ static const struct usb_device_id rtw_8922au_id_table[] = {
 	  .driver_info = (kernel_ulong_t)&rtw89_8922au_info },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x056e, 0x4026, 0xff, 0xff, 0xff),
 	  .driver_info = (kernel_ulong_t)&rtw89_8922au_info },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x057c, 0x8701, 0xff, 0xff, 0xff),
+	  .driver_info = (kernel_ulong_t)&rtw89_8922au_info },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0b05, 0x1bcf, 0xff, 0xff, 0xff),
 	  .driver_info = (kernel_ulong_t)&rtw89_8922au_info },
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0b05, 0x1bd2, 0xff, 0xff, 0xff),

---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20261123-add-device-ids-for-fritz-wlan-6700-4c780f4a4bf1

Best regards,
--  
Nicolas

