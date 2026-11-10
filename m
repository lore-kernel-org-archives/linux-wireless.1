Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294313;
	b=Xcq2u7M73trU7ruKyXv+P3BWwie5RuWYOCbcTrprlrUGsFHMd2o7wlRvawIfxXvZUamJ
	 PQBHHPzYD9yrpixfDGZd8s59WStx4y1oi8z7xyc/wCH9gA/fRsneLucWsSspxuSmkS+fV
	 bpQQDJFJF0mi677E2htlowJT3c5a8QeU8cndBLwreDIU6hqLMmlB5yBuKJy/E3nMo47iT
	 oFAqTIsCITlzqFvMkfZHhf/8AM//mmOzt5VvVRadCQ3hmtmcxnQdRUQNeVmpTG/W4z8cy
	 /b4eXwPz5MpoA/NS2Pkp1Z9sB1stlJSOUBkRon8XUx4T5KSw26CuPe4kyJt0RAZj2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294313;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=0jcZj4HJzUqheWN+ipfUSx0JuhMeqA78SKrxSiCQIMI=;
	b=Gpc8qHE92kZUfXzJEcXbKsLPn41QREC4op01uW0BOC6Zqb9M3rghJxGaJ8woFDAsGbpk
	 BIO4PSHcdiUNUuYCmGAY1L6gbjTchXFKhI5Bp43tplhdkFBu1tvNMXWqYXksYDDQdquXG
	 xvL3z73QlEv+hH+J9ipzOD895j6WJTrWY2Q0X2RwoxqaIcmcAnqynDgFTOQXcCRHqXiWI
	 impJXxZPSOIgjSBQJre9pr+Ci8fswDyD4GpyLGkG+MwmwjibUPy6xXR0XZoV+6iDfJjav
	 oF6EpyFMz3Btvpm4iwxZg+/wDL5RBnzGiq7oX3rcQ76inOVwdBvMEYsCJntY+d8m9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=guwolf.com;
	spf=pass smtp.mailfrom=guwolf.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB42606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 07:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=guwolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=guwolf.com
X-QQ-mid: zesmtpsz5t1794294277t5ac97080
X-QQ-Originating-IP: RJOUZCuS7J8Rup1C0vR58n6JGkacPVTB3tnEeX3TURM=
Received: from [127.0.1.1] ( [111.55.209.194])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 15:04:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10659635888394070846
From: Hao Tan <guwolf@guwolf.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: rtw89: coex: Disable pre-AGC for out-of-band links
Date: Tue, 10 Nov 2026 15:04:35 +0800
Message-ID: <E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com>
In-Reply-To: <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
References: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com> <340ed206ff6a4680a46806e3bea5dbc5@realtek.com> <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:guwolf.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NCjYbQ0FTrEVKbAZf3dcH1XFY+EWUuWnNy+q3TKR1zOQRAzN50pIDRm7
	nuSOK0W29EP5uuB++diRvvUzDO17HCNzA2TQtMwI8QEjWb08hUw5ElZMxOBivArxlYa7BXO
	VYFGI9sYM3q0wbowUN88jEDY6lysRRgtV+/8Pf99bNQtQzgYSSq+4eLBX48htZNEMuJKcaO
	aYPAAPnR1nNWPePzvgzdrH19Cl4FGYNY51rA/hxHGBS5X7rXFfjM1/ubMV28qm/jV0ZV+hk
	y8stsXMOWsUn170DRCO3qh8mJpRcwCUIdLDGT6n2ThQmWu2zYOdkzHhltbnxgR1TTt8TZx2
	TtHFiBTScAfx2F6ioe1UJa4v7KjVKnlUlx9NCSUoSwEZvQGmeIlkpNJkYfCmxh1Bvr7K4Wp
	tscPxDrYrwluEgmBfpcOcNqZ+358YtGTUQOHC2K0c7dIxg7IOTPuaQPUWcmC5WD+Ob15F1q
	i7o2PoQAJ1Z4pCGe/B3zKN6dvYXQshczZQ0R6qD8WRY31KorKLMzSIuwCq3LDz2bXkV0JBv
	P45ZsN8bj4NPmMwQNfaPDQ3xQ+KjaaRkCrfRv/ax2GXTtKflW3xy0zcDz00u2Hw7uGrPGoc
	9taTYA/nxZS5OiED6HuxcJtx3o+bW63Zocqtf/rcD/PMRRAiYOK+uXwKZY2xnTRgm8iLIuN
	81y2BzOV2n9dtjGP3E51Xc2vpl88ForcUkbmMq9++hacXptNM9Z+FQJESV/CBr1/m0oZYxT
	yAYAy1UcImHjpt3g/qdya+MW/MYz3q5GMhGqp4Cd6zMpZ98pGSOgzLKU/zkze5iUZVN1/bF
	eUAtiyEzbsPxYzJtNPNOpD3D8waRv5mBmJ4rm3r0Bi1nd9OEs3BOu7Ae7osCwTRebjNjUhH
	0PlyFTao4ZFIPXc8XNl0dW5kZhLtCYS6nQwcq4EyjeNbssv1GhJM6wqKPLdlrAOMvxSJNQ5
	wooXnPs8picoE7mZLPYlrTi5e9uRuIYtX2TJvthxlY98RbQ3XUAu5Omo5GLt7ywUzNdj+V/
	g/qw0QvvX1TIFhCDiV
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

When Wi-Fi and Bluetooth are on different RF bands, neither the TDD nor
the FDD binding has a band. _update_coex_bind() records that as
dm->out_of_band.

_set_wl_preagc_ctrl() disables pre-AGC when the TDD binding is 5 GHz, or
when the role is still NOLINK. After commit a76501e1d148 ("wifi: rtw89:
coex: Separate _ntfy_role_info into two function"), a 5 GHz-only STA is
no longer NOLINK. With Wi-Fi on 5 GHz and Bluetooth on 2.4 GHz, tdd_bind
is empty, so pre-AGC stays enabled. On RTL8851B this programs the
pre-AGC table, and a VHT80 link drops shortly after association.

Also disable pre-AGC when dm->out_of_band is set. Overlapping TDD and
FDD bindings are unchanged.

Tested on RTL8851BE (RFE 5, rtw8851b_fw-1.bin 0.29.41.5) with 5 GHz
Wi-Fi and 2.4 GHz Bluetooth. With this change, VHT80 stayed up for 600
seconds on v7.3 and on rtw-next 04c998418722. Without it, v7.3 drops the
link shortly after association.

Fixes: a76501e1d148 ("wifi: rtw89: coex: Separate _ntfy_role_info into two function")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-wireless/340ed206ff6a4680a46806e3bea5dbc5@realtek.com/
Signed-off-by: Hao Tan <guwolf@guwolf.com>
---
 drivers/net/wireless/realtek/rtw89/coex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/coex.c b/drivers/net/wireless/realtek/rtw89/coex.c
index 61e8b601c..411c1490b 100644
--- a/drivers/net/wireless/realtek/rtw89/coex.c
+++ b/drivers/net/wireless/realtek/rtw89/coex.c
@@ -6604,7 +6604,8 @@ static void _set_wl_preagc_ctrl(struct rtw89_dev *rtwdev)
 
 	if (!(bt->run_patch_code && bt->enable.now)) {
 		is_preagc = BTC_PREAGC_DISABLE;
-	} else if (dm->tdd_bind.rf_band == BIT(RTW89_BAND_5G)) {
+	} else if (dm->out_of_band ||
+		   dm->tdd_bind.rf_band == BIT(RTW89_BAND_5G)) {
 		is_preagc = BTC_PREAGC_DISABLE;
 	} else if (rinfo->link_mode[RTW89_MAC_0] == BTC_WLINK_NOLINK ||
 		 btc->cx.bt0.link_info.link_cnt.now == 0) {

base-commit: 04c9984187228904f222681661c50db3f0c50b71
-- 
2.56.0
