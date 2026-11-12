Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463600;
	b=x0Q3IKeaLb7SjvJGVy8CTLbKfZbgO4HprWp0rSS8IUAnrbQETrxS0iRH1pzfn6CgXSAS
	 UCSVKjGIuN8Z7kuE9g2i5ZlMAUOcF3fRQxkAt3PRIF9DlyUNOtZZx3bDfLOZVwwS/Ayzb
	 mU/V2QIVt8NXYpnjjoi0EWYOycQltexB8uK9muyMlC5arzGRK0FJSqQuTXBBhhuNcii9i
	 HBN8hJf/DsAD9H9vKiEYl/y2d0txXuASGQkKM45A/e4YeasoPi6HOz2jaE0UuRoF68J2k
	 24s9PP/mJStRUz8HiYkw8V2Hlk2oWVjztBYiAbJ9NswcxJ53W+ovEXXCQlWm5cDhg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463600;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=e43A58zgzHroy1iY3/A/YgCrQXusJ1rIbkPbKrgzuUg=;
	b=V/QIoEPsoEgVsUVGBE3IV8iLKw+cRvArna/TmR45PEQpjwlh4q3IFHKeVNJnaRuiA9Bz
	 SDIzHm9+aG8uDdl0SpUb21IHCg6+pJhO/Pd8cZAQkl/oveL77GE6Pj3avWUlT8CLM5Tq+
	 kzi6rwO16h01zQOUuAjsPvOo/fVkDTQkyFEn4++ZrDy2CWffQcD3FWnrqvjEK3u0lvKCC
	 8LxAVaZY2oLC7mSCjtG+VwyHfnz9fM5K2DF3yn46AzgueVD4hBrpBq0Pkv0hxeJivHVl0
	 o+K08iZjYWZKYqHNbNRfL0tqG9eP69ftJ5amlp1B387Qdjh9vQCsr8HHy0L9nTPxyDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b="PejA/bnE";
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E393606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 06:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E393606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=PejA/bnE
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AC66bmbE3489327, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794463598; bh=e43A58zgzHroy1iY3/A/YgCrQXusJ1rIbkPbKrgzuUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=PejA/bnECun8+MLG69e4rSfDsPlEEGCyJINhZ4djJ7WMh5rlLV46G5ssQ7JqFHa4b
	 ge+G/o4spihpvE3vcme5wtq90c+o2ZmQQFByTDJ6Fc05M4zELs1GvGPYc0jl6jsZGr
	 nsEMnsSHpOuusODqy68F+IOJrQ7UeyspvdIg8PQhzixBhJbjzHK9xSL8u2qrhErOHk
	 W+pAthcIL/9kD0nq5J7xt5+AXN/5y/Ewc/9GGbMbQ/mZnoPEwCzDKqsBVIv7loozn7
	 Vs0J6woqg3Y7dEafC4efW4h06bWHc/ssv/wd34bTWHsR9G3cVFhfFslKLboq8MvzY1
	 5yvUH/4D/1/oQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AC66bmbE3489327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 14:06:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 14:06:36 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 12 Nov 2026 14:06:36 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-wireless@vger.kernel.org>
CC: <ku920601@realtek.com>, <damon.chen@realtek.com>, <phhuang@realtek.com>,
	<kevin_yang@realtek.com>
Subject: [PATCH rtw-next 05/11] wifi: rtw89: 8922d: correct thermal trim range to -16~+16 programmed in efuse
Date: Thu, 12 Nov 2026 14:05:54 +0800
Message-ID: <20261112060600.71784-6-pkshih@realtek.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112060600.71784-1-pkshih@realtek.com>
References: <20261112060600.71784-1-pkshih@realtek.com>
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

The thermal trim value in efuse can be -16 and +16 for productions.
Correct the range accordingly. Otherwise, wrong trim value 0 is adopted.

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/net/wireless/realtek/rtw89/rtw8922d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw89/rtw8922d.c b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
index ca7491bb9045..2bc46be72e0a 100644
--- a/drivers/net/wireless/realtek/rtw89/rtw8922d.c
+++ b/drivers/net/wireless/realtek/rtw89/rtw8922d.c
@@ -1015,8 +1015,8 @@ static void rtw8922d_vco_trim(struct rtw89_dev *rtwdev)
 
 #define THM_TRIM_POSITIVE_MASK BIT(6)
 #define THM_TRIM_MAGNITUDE_MASK GENMASK(5, 0)
-#define THM_TRIM_MAX (15)
-#define THM_TRIM_MIN (-15)
+#define THM_TRIM_MAX (16)
+#define THM_TRIM_MIN (-16)
 
 static void rtw8922d_phycap_parsing_thermal_trim(struct rtw89_dev *rtwdev,
 						 u8 *phycap_map)
-- 
2.53.0

