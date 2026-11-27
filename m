Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802460;
	b=ixcW1hesr8+C3fxjHzXheIayKwix1UOlJX7d6yG2D1Shc1WXQ48uWVd+sg31rE2YJgLX
	 ajASE/Sg7Q4RTGnPwagExBvCVUsC7k3ej8v23BSGT/bcXGqjIpe00uVq2DQdexSKUP44l
	 82qUdMlqA70hsWkorWXHGk/S7qW3cQK1DJh6cXlC5bIvuCHdDj7tCBGx2M8W0FQD/vQLO
	 klkVx1MsFQkeVFoWFGwhy+DFJUzE8zOcrYAKuaRwLzNODVkhiNi67+84wme204KRLqlcN
	 vySgSkTRUV4vPKLWNzEyqYJvIJNErxJtC9qj5CdfVb9rF1x3shEd5KwL1Mvp3fnoenQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sD4nqR9HUUAXwuOnuYe/kK9y6NigVKxQ6UTKCLS8n7Y=;
	b=LuI69HKSgr7F0dnIrP6jLyW1npk7bWZP788RcqaO0t+x3OQwG8/mFtWZ0LL1EojDxzTx
	 n01mKSy4bzSADfOvWHyyzz6/TGc4vIeQHVll/9DgHKtSRD3uyAYPIljTmVERXG6U+WJE5
	 5yk6SKOJhhYu63i9MZpvttyAvbuRdkTgeu/hDixVzV1N1mx23DXTVN1lTJ+SzsslrGOKW
	 vUzj+7elXVFiYHRpCL+mcB2oGWKxlw6jrSAKes9dLPnNmjtdDlhRunj6SOL4M9FVyO1Fi
	 pQTzZjiavXw2iKehf1gCXheOeZqotWz9GdZa+BuAnaBntE1HxXEraIiVYbZB9xGtuGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfQgkrv8;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0164606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0164606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfQgkrv8
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso6477153eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 10:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802459; x=1796407259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sD4nqR9HUUAXwuOnuYe/kK9y6NigVKxQ6UTKCLS8n7Y=;
        b=NfQgkrv8cjoDfu1iKUUCE7gzSwBR89K4DGL9B9rfJbYt525kknlTG30q9OOhVF13KN
         4Qej85duFSJpgOHVotgxXf4l5hTz9AKDZ6MmKZMl7DPYfjRYAWG8Lfzs21e9j8feZD4s
         kO63VngLVrXSeAqM0mH85/7f6YYxV0bQhkg9O8MQMJgaoXIwmr6yTz0tK7qjeLvDlOsL
         kdvIrtO+aJYTbGrd9XkuER+//Z7ZvSN4BiWz4lBR4WijnTqMwV4sqdPcH7TRtSH3qHh1
         p0GAw2MghE8Atn2OOLqwBpuabLJBb19MKAWDlVFnPjKaFmcbQ3BQtKjiI+ysiSD/C7NB
         Qjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802459; x=1796407259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sD4nqR9HUUAXwuOnuYe/kK9y6NigVKxQ6UTKCLS8n7Y=;
        b=TfirIydKMaIw2hTBEgqRYYPH64DaHeuz+uTchMzPRRPhkMe2UhEsbkOyDdpoWczTZG
         1KqesY/yIxJqwjAgcSMAZb+KLRwB7fMBdWuGXVgI0kbzlvjaLqhGsJkv0PHKF0XdULOb
         HcTTuIImIe6L9TIpNGnmW4OpB1QtIFx0laGBxQehfylO2XpP+OXDBR8GZrJI3jDkHwwg
         T6SG3ktX2RqSycS3y+khuatToj4TyJ/whQx1VJxjdZ03BgQK0r76D2mM8W595LfipTrU
         24l6TDkuB8SXYQFufmAmTu8vC5w+tVIdmXMbzOLn7e5NdL8gdGF9up3rvKdnEXbo5AcE
         Wflw==
X-Gm-Message-State: APuU4Z8xbFyp9XNStCL3RCc/AXpirN31RnoWyZr5ccNCLLeyUF+pf2ba
	FYEfwMu0DOADVSzVDWXz6Jo+rUCuAPXYns60oi0StOWRLVoxzVFIPGsS
X-Gm-Gg: AZFdTZcnq+KMIfg4DoacE9uCjr4+AU72SQCbAAMiab48NMwUkpqsKysz9vxIPnPpHPk
	MyPHqn7Oc/tFxGDTAPTs5Mek9qnUC+bowFZ9OmrwIRhjoebFp1al0TcmSZEmBANw4xhK+4t/Wx6
	MKBoYZAu1AHy3GMF7+nugCnU7q8fMAwgDKK/3fecO0anEZKdh7mY1DxUpPlsIqxxzCfm6Q5gDWI
	CSNqmwRqDJZa0w8SkPoF+prF4X6JINKW/gUvWcaiNSnkqQvQGR6M5fI11nbYGLEPoRCeYC2SJ1X
	2i9fgIMIOazw3s+UNwh3wX79fOHRPz25gjHhWwtd0kgxwT84zm3dwur8sAW+FXnxqwRRNZL+qqB
	j90KOwdO94/QQKGo6WzUjyyvZMoYqEthEyv8SFzjHVcLS1O8dtZYsGDAhdGquuAFj3oWTIATOoy
	4OFhAS8IBU2TzFoFNF/UHDlNaOLontFtNIWBV2wUXMUx8dajU2spz1Bcf2QiXmWsTnQmHw08CY1
	v4DuUdAsr8Sc+4iawxVzaJJCR+lyzKNsGsZzG1B5rbmZK15+Btmqa4/1+Sn6C550geXDvNUsiPa
	c4h6ck/1l6k8L65Jjo7uo4iEQrdk5O3fx9FTfuJ4dSCZIRINuCTlOcKOJPMdsVAlGchjG55LXE0
	eP18sR4CHvnSbO38lZuf0M6PtTulDJCC7NsKg9nI=
X-Received: by 2002:a05:693c:41d0:10b0:386:b950:6ed with SMTP id 5a478bee46e88-386b9500827mr14653052eec.38.1795802458576;
        Fri, 27 Nov 2026 10:00:58 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:65f1:53d:ffe:71c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm76044620eec.28.2026.11.27.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:00:58 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v5 3/7] wifi: rtw88: correctly expose beamformee capabilities
Date: Sat, 28 Nov 2026 02:00:23 +0800
Message-ID: <20261127180034.1058591-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127180034.1058591-1-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com>
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

Both SU and MU beamformee flags were set on every VHT chip,
regardless of the chip limits bfer_su_max_num and bfer_mu_max_num.
This is wrong when the chip does not support SU or MU beamformee.

rtw_bf_assoc() also checks these flags. With an AP that is a MU
beamformer, the MU flag makes it take the MU branch and return at
bfer_mu_max_num, so a chip without MU support is never set up as a
SU beamformee either.

Make MU and SU capability flags each depend on the chip declared
maximum instead of setting both flags together.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 2064a6f6e4..1b0044c3d0 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1614,6 +1614,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1632,10 +1633,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
-- 
2.53.0

