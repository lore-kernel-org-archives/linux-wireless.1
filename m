Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015824;
	b=VYBwPw5g4na1mXTNm46IPoHYIvEFXvDn1985ufC+2LuDNxNfLL9AKUZDLrYx4PbPez8M
	 vNPWsAGrHy6vLp5hWS0BAHMdGeSp3alfvQf8YMGBCvq9noh25nFtwpJsAQJLCjW8ytfSB
	 2ePoOpUQPxBY6O/XrA1UWhUD/bt7qAtChcrTbTDbFe0HnBtPzN5oTH0ajRG+FHZ3CykVP
	 SOTRV9r4JJ6HUIKu6mBhz+E/S65KG3XWyLABhJTF1reKwH7ULqEiE8P7KbHCwL2iYqMMS
	 tfaI509XMO0ridgFlcAsynJu/34lwnCuQGZcl1Fo9dujDX8U2+dMaM7dccEMxWP1XIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
	b=IM8gITg3vTy5pks5gcjk39doEadkvM8gxtwVDimndkgbZR8k/dyu3Y33K++CKf81YLep
	 RghAbF3C8+gp3X05v+CfHsIN1oyrUdZN3vSO8o7ZS2UdhM4PEKq1u0s7mtLcAGCHeGpI3
	 urnN8/rqVO+E43ygS8KX5NVEpkr3KUz9ca0GBj+YqKGfuPw0WtrjUPfRoc4+pVMXO/adI
	 kSbr343jR0XC2aneVdvyktoXJArIJsS7CDy2p/XOfV5wAedc4kXBy/q+xZZaH5GSU/D23
	 wKowVwo9jD45KYQQbqAneqxb0bwxD13VuSzhh7rCxlRJa+i4fY99Lh2qRW79TCJgPsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6uWcVQr;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDC160A2603
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDC160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6uWcVQr
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so2701513eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015823; x=1795620623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=F6uWcVQrM1ix/hWYJWn/zSpbvp5y5DuKWIloSvzXxQhnMk150O6W73HYmuVCUQMaCF
         WpakeeKGe2hWKvi0M0EIxrt0iPcr/KDtkrLnk/oQNvbMijYuSX3a+PiaFRxi8BcHygMo
         P83KCXfV8Vbq2w6QeoMaZtfGVOeVlm0flu8XJnT+asq92yOZbrhHnEpDqGiURmmSKMn4
         DgLhTCI6jsLEguwDX3vldS6a6jdpXi2BnW7kLbmcaTKqcROI4DrXxRYYgQDep2Y8H40q
         gQUsEhYWGp0wwz1IeBerE1ysO18L5UvbVQs218x9fGy2dLmD3DcWrc6LkWiTvS9OJQyW
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015823; x=1795620623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=Z2uJXi0ZzoieVzC9Rm4OCP5oMja/ixv2NSoBY1iVVP8ZK4cbPAHgj0yzs2x5krW7h3
         EKy5VMlrsccWtHMYB9EQeuMjgNCaDyeQs/OVHHrxW1iwzH6NzW9VeEZj93sQIk9VAuLq
         EdBnn7heWtrhiAJ3RlBK0uMjQXyqK4yc123zXsCYekDrPrbhD3GA30P9YedtEpB6fOvd
         pDuI9IiAU3oWLUBfDLscYjjH4zszxstZZQXX3MQrdZtJIkJQJFXN43q7RoMM3C+HNZ0u
         NbbdG8xnqYWD8QVpNtRgMa7y159grQTVNxiYdcUPGwkm/LWopHHAsObKw1jrsek9aesQ
         JPag==
X-Forwarded-Encrypted: i=1; AL+hErHws2O3nPoFDI5XuocILnVWSdRdX/0d9JZ+m1DROezXOy1Kb6IMkk/zEJ4wC6nh1V5uFGnELjj0z4T/QZv+eA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+p/oiDgEg0k0UbaFwAeNbSxS3yycMEmmf1IkrYWLubrfbcAsr8
	jY+dVVu8NdC2Rju6d8HdYdiflYjd3BZJQ2qIbhjQQxVexfqEB+fV8zuz
X-Gm-Gg: AZFdTZehUM+Gm9qZpwzCst0yT4vzQNNaXFc+W7E12ZalJwoG2VWA+M34VW6lEsambyd
	WMzqxAalO32u4QsOIQzm+9QixywajyxG+AstJZScAe6ky5WET4WjSmxkC8440LGKrw6OcHygBin
	YrTEAtHMZ2X4ZwXzwSphwkZMSNrr1cngjkWa9SWFofMfZ7Smiuv+TS5y9bTSoexIV0Dl02hmyXd
	AyvX2FhHpTeCAXV71aAlXEko/ODVgo8vv+dVOMYWGVAtJx8eGLn+WFa6BkELlYOK4FBFyeTHNhs
	Byan+CGjKyblWq69tTO1wWTzOVXgWZ+jiQqfRNWIdIV2TCCs3+bMudL7G1ndzC4I9qCYb2N/Qvt
	CJuUpWyK0swDypDQKd8Yu0OhBYrxlskjfjWdZ7yZxg1vhthSSixdNa0Ddn+1wExQSPsTBD+ckx2
	lJ3D4kq5dEHWHqebu2sW64mcr34bE7IhhSijaso2IdC14UgKHdSIYcVj2b3Zy44pV0uW404D02k
	tmxt4H5gq/hjM6D/km71ilsq6D8k9LVjTAVWNFa8kTsRVriSVvYMDRIVx6B850+eki8JNVfHLEL
	qV8rCdsBeRMFEG1HgRevsa95MKKk5HvSXNCpOf8APy7Rz6G51irMRYNkHly0QhYnNdQtOpuk1vf
	WcUr05A==
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-3828161f1d8mr2879861eec.41.1795015822594;
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 1/3] wifi: ath11k: don't walk an unallocated regulatory info store
Date: Wed, 18 Nov 2026 23:29:40 +0800
Message-ID: <20261118152942.62838-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
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

ath11k_reg_free() resets the regulatory information of every radio in
ab->reg_info_store before it frees the store, without checking that the
store exists. SERVICE_READY_EXT counts the radios before it allocates
the store, and since commit 64828f091c7d ("wifi: ath11k: fix
reg_info_store leak in ath11k_service_ready_ext_event()") its error path
can also free the store after a firmware restart, so ab->num_radios can
be set while the store is NULL. A later ath11k_reg_free() then resets
the radios through the NULL store and faults on the second radio.

Reset the radios only when the store exists.

AI assistance was used.

Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
and a test-only allocation failure in the SERVICE_READY_EXT handler that
leave a two-radio synthetic device without a store, and then calls
ath11k_reg_free(): without this change the call faults in
ath11k_reg_free(); with the series applied it completes.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/reg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd90..13e2ac96a12c 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -1049,8 +1049,10 @@ void ath11k_reg_free(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < ab->num_radios; i++)
-		ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	if (ab->reg_info_store) {
+		for (i = 0; i < ab->num_radios; i++)
+			ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	}
 
 	kfree(ab->reg_info_store);
 	ab->reg_info_store = NULL;
-- 
2.56.1

