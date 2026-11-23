Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441293;
	b=KW8FVsfrmKB/JaJfKtJoXMghByxs/P4R+GWvbzUGseSMXFsHcEBr2UWFlTrSPyFx2Zdn
	 Fv2gPWHx1dpk9LbZNbr0H2KO4K7vCfjyycFGwNWXIv6X4eyzhn2XPPPktcz9rhtSxIMBX
	 uvS5IbmBtv5GsXkkbXSHy1Rn4aqtWTdYaEB5fyCPU2WWkDLLAJBU3vCcdr/m4/bX+H5j+
	 hm+ihoqLEJwXo0/WfiJrvwxuqXmVOPC+XPDL/MlMNZiKbLT05IYiRsMpif/E2m1woOkX4
	 3YiiXVUXdeIL6oqJzm4BCbgr9D31uQ5xBIAnD+G75vZPeUHJQ/mtOwuXfWe+u82ghPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441293;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=kk0O6FsUbI6IqSxRML7AdB9JDL8H3GMtqKaOXf3PK5Q=;
	b=nxeT9hBNr/WZe0LVU1B430xFkDOLvOeLHJoPA90PVzltbKaWg1NpGktGU4rxUFAMhEhe
	 e5OVfgJfMxenK68/VEm+h94d0JcOhAhb2gNIWl3NAkM6YYOOKmn+FytRdeUYLlbr3eUlR
	 IR8vLUQljHGJJmW59XV0DJVi1aGi8GL5XDQPj0/H68dBkbjBZ12YgT0PJcDXPHk7Yp0yr
	 wpcwWTNx+01I7rbR9s0KLC0wTjIgFgvi8BYrL02A9pu1Ooo2DmewIK309RIxFVU79hpVL
	 5S/qnLQXKjVGzNC3ZqacajcTSIr/pQSOQWpiiS/bUVjkd67b8KOElC1wostOOQZ5T1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Dkv0QSR3;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB4A606A33F;
	Mon, 23 Nov 2026 13:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB4A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Dkv0QSR3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795441293; x=1826977293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3D66E9ZFkiuAsMOtY7kx4YXj6uhi0UO5gbC6qaimW38=;
  b=Dkv0QSR31sOFQ7ba7Kv8sNsqAF8FqZ85qjZak0WqUzKbWnJmqfSt75IR
   6FrDEQOwuG7T9yCDvB6YmpBwbHlWfjMZa1xYj56ZcBQFEejYaeyKN4dXH
   mAepbQorQ+mKioXdRbM7Wx7Tty/S8/tBSEu+hX4V/kBNn3WXaiYPgzIbf
   ueP/StyNMnWckShRnreA1mF+vUuH0sai+vVAdNaUgdJePw1+dAfewUcpc
   LslhYuyvt/vrZKVu0Zy1bJLex24/3vIjbbGzVHJ/Q2LitqftLC4u4uuPn
   ULvg+KuS2/AiHu5/xgc6rD0bQkJfU6EjTabXvpj41LXRGBsj5timkLIW2
   g==;
X-CSE-ConnectionGUID: GRBpJNWVSmaz84NzQVCckA==
X-CSE-MsgGUID: wyx8iKpZSueRL9sjMirEKA==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="298331362"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:41:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 06:41:31 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Nov 2026 06:41:30 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mihai
 Sain" <mihai.sain@microchip.com>
Subject: [PATCH 1/6] wifi: wilc1000: Use netdev_err() for WoWLAN trigger errors
Date: Mon, 23 Nov 2026 15:41:15 +0200
Message-ID: <20261123134120.32638-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123134120.32638-1-mihai.sain@microchip.com>
References: <20261123134120.32638-1-mihai.sain@microchip.com>
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
Content-Type: text/plain

Use netdev_err() instead of pr_err() when reporting failures to
send the WoWLAN trigger configuration packet.

This associates the error message with the relevant network
interface, making diagnostics more informative.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/net/wireless/microchip/wilc1000/hif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/hif.c b/drivers/net/wireless/microchip/wilc1000/hif.c
index 60fe5f08964f..3b7d42ebf59a 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.c
+++ b/drivers/net/wireless/microchip/wilc1000/hif.c
@@ -1031,7 +1031,7 @@ void wilc_set_wowlan_trigger(struct wilc_vif *vif, bool enabled)
 
 	ret = wilc_send_config_pkt(vif, WILC_SET_CFG, &wid, 1);
 	if (ret)
-		pr_err("Failed to send wowlan trigger config packet\n");
+		netdev_err(vif->ndev, "Failed to send wowlan trigger config packet\n");
 }
 
 int wilc_set_external_auth_param(struct wilc_vif *vif,
-- 
2.56.1

