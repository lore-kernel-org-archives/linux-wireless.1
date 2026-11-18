Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970344;
	b=KhRc+I+znf/QJuwwPOLnAXINB0zn/pD6KQU5dulhNGeBBNsjqYY6iqVPRFmjqHpQvAGz
	 gqOwPfrvikQHGQandRFStmG7mKIYWzfVh5AMho9yDwWC4lsFffQc6NePpwZS55XwSxe4B
	 Wx4R3nNWdosg7g+wn2Y4MZqvNEk62M1VspZw2tRHTv9EVOWdL2oJ+umzU5joZgRCe9aqN
	 EQc8Pc7smNp6bBTTxOMjvweBm/+yoKQm/AxpzdNDUB1dOsVMWKuvwuw5PyHqeQ9bcBmwI
	 dlwduZYa0RRMp5og+fUVmuMp8h3/ohVIVJVgdIDT1HmGDPKEEL7c2kULwJaLeAsG0ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970344;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=Rsg6aV4bxpdzVAHcRZvKOrjmcxZrQlFZTNiSHbakTIM=;
	b=hrC79i7ZlyPJTkCdK3nhKVj1+o+TZMILg6CUSfQVUlTzn8Xw7wFh6ebq93QdOCcjukli
	 TZd6EB83VabZj4GKIObunzQzIjjp8Un6tBB0+BMA9pGyLb1tgULXQwcfPT7LYMG0L6JQD
	 ZiRQD51U7SvSFSvjZW88MHyk3gYOQ3YhCm+o4VmIRruSwp52K97wNv2PKkeKa+j58o6LV
	 kDc04aIHYGogrkjcSefgdM4ChEPJT9TyMWySnMylp6fILoLs8LQfU8hsPKMBbfTmDeB8M
	 Qpg0w+DWZ+QXOnGvWN8UJXPocPfD3rwjWKgJQSlSWrD5zqAgOmtIPt1DAyWdvhWFUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=t7foX8jL;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275E9606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 02:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=t7foX8jL
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AI2qLRc9920043, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794970341; bh=Rsg6aV4bxpdzVAHcRZvKOrjmcxZrQlFZTNiSHbakTIM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=t7foX8jLALHYNUaCnAhbgmZd04CKcjzKC8iz4IuAE/c+NXBCDVQ3HBXyZaglYVNaH
	 KCG3127EyIqrhd9eZG3UZL/+NJv5kyh5N34TGTSl44jhrsdleqvfDVVzkTqrRl7wAG
	 4zYY4xeJ1wJXwOKq3S1axbfsssMWOvFsX/phYFSxFC9XTtmUzd3mZoHoJyieaF9yYh
	 nAwS5EKUtDX+SZsVT6kCS8JpVBybM6/2iN6e3MCFI7+fajOQh9jnRAfCiH3ysuJu2G
	 9sVXVBZPVOYlZ3L0GbkuBXRxBMgL38nqir3AKECHi3sjPHsETSITxmyKOp+KUpQqWr
	 ues7LIJUqFF1A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AI2qLRc9920043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:52:21 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 10:52:21 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 10:52:21 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Wed, 18 Nov 2026 10:52:21 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
Subject: [PATCH rtw-next] wifi: rtw88: debug: explicitly cast to u8 for %02x format in rtw_debugfs_get_tx_pwr_tbl()
Date: Wed, 18 Nov 2026 10:52:08 +0800
Message-ID: <20261118025208.47465-1-pkshih@realtek.com>
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
Content-Type: text/plain

Explicitly cast to u8 to avoid smatch (with -p=kernel) warning:

   warn: argument 4 to %02x specifier has type 'schar'

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw88/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/debug.c b/drivers/net/wireless/realtek/rtw88/debug.c
index 1061a1f4d5e9..11de50d39939 100644
--- a/drivers/net/wireless/realtek/rtw88/debug.c
+++ b/drivers/net/wireless/realtek/rtw88/debug.c
@@ -739,8 +739,8 @@ static int rtw_debugfs_get_tx_pwr_tbl(struct seq_file *m, void *v)
 			seq_printf(m, "%4c ", path + 'A');
 			rtw_print_rate(m, rate);
 			seq_printf(m, " %3u(0x%02x) %4u %4d (%4d %4d %4d) %4d\n",
-				   hal->tx_pwr_tbl[path][rate],
-				   hal->tx_pwr_tbl[path][rate],
+				   (u8)hal->tx_pwr_tbl[path][rate],
+				   (u8)hal->tx_pwr_tbl[path][rate],
 				   pwr_param.pwr_base,
 				   min3(pwr_param.pwr_offset,
 					pwr_param.pwr_limit,

base-commit: 0bdc579dbfc251a6b6838ee9459b6771b948c617
-- 
2.53.0

