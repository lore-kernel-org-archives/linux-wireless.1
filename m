Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319862;
	b=YrMyQwRYZMyV6M7kmbnhDpZNxKEii8q//9H4+NGy7G+MLKeg3CdAJ+iIKA+N2vrbseIc
	 hL4p2pmvhNW7nzyCvP/vVJebM98nhL9kh0du9J4FhRDlXuOOWK1SPyViY2pMoG707d/zJ
	 O+s96YE/QvUFsAvZfU5fYmJ5zdOl92yZaT5yRBDdt6dOy8/oYWaA5l+/eec3OnFUxqu+v
	 +pbnUhnO0BY0zcrQRV0P71JydKqEfGezego2c7YGF3RTk4NW+5MQNW/4+4J9Jic4CqjUN
	 tt3OYKITxplm+0ouqU28uQqmsiKIiNrN8ardCH2iH6gw3/lE16jNKQAmcNkonLJNAcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319862;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=kQa4NpVMnO4d9VCkBVxW+Ui76e28zDYBy/qZfk0y2mo=;
	b=Mes47pIfLGgGVRrULRqeT/05OUWQ7sQLHc8GV3GUqRAkFjVQEoCS5zsr0jLMEgIT0i+C
	 JSjSMkCri/NRHaHA75XtiRLe2v1eYUFIt+NKSD0U0OLkAJoPVZQrpJELeA/9VnbYuKktf
	 xIfFpM5lOSVEsfREFZV+JZjJU5ad0HkW+MQLQwyl05wcinsR82vS7FSEb4PJtUyeX/sD+
	 l6DN+/k8esU/+IhWkXw4NDSBb2VkW30pUR38q2f1v8e2aYNFXd60RKiTfjooJa6t7iRhK
	 Zu67LwuCy45Bpv9odw42DILaroWVlhxV4ebyDFzYNdsG1xPVAwVp6dYp4oahA7ZZzHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J6PFsWKI;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D5606A320;
	Sun, 22 Nov 2026 03:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=J6PFsWKI
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM3vPk25548712, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795319845; bh=kQa4NpVMnO4d9VCkBVxW+Ui76e28zDYBy/qZfk0y2mo=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=J6PFsWKIz/8wNa0r1FlzuZWiqt7j1WQill2EjkXyCltQ5/nV1Dm2hVFnoG6ch+H0H
	 p1SYEvdiX5/JhXpkVS6+/rauI7+dnXbeaRrIeY4/iIaG3t/kIJrIY7Q6U5auGjsECv
	 3XImmwsscI7cqhMcS5CVMWJsH8FXPHHhY5fB1w6rA69zWQ/ryha4vZttqV1hEJbe8D
	 cYlW59dzOrTYAJipGMsXR1PlgYOaNxFWCwXgQ5zzMm4dREYUtiJHeeK1Pfe02vPCwp
	 cfQTblFkPvaGD3y40fykZS8SE8eFhAd0FMVWaShSlxvu1XhRf6SA1ot3GICigFp1Bw
	 GzzAX2l7YSd/A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM3vPk25548712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 11:57:25 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:57:26 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:57:26 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 11:57:26 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Shirong Zhao <shxzhaosr@163.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtw89: read the beacon header from the frame data
In-Reply-To: <20261118134625.801221-1-shxzhaosr@163.com>
References: <20261118134625.801221-1-shxzhaosr@163.com>
Message-ID: <9a5e8c64-9e63-4c94-928d-08dd2e0a2285@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 11:57:26 +0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Shirong Zhao <shxzhaosr@163.com> wrote:

> rtw89_fw_h2c_update_beacon() and rtw89_fw_h2c_update_beacon_be()
> cast the sk_buff pointer itself to struct ieee80211_hdr to compute the
> TIM offset:
> 
> 	hdr = (struct ieee80211_hdr *)skb_beacon;
> 
> The 802.11 header lives in the frame data returned by
> ieee80211_beacon_get_tim(), not at the start of struct sk_buff, so the
> cast reads sk_buff metadata instead of frame_control.
> 
> For a freshly allocated skb skb->next is NULL, the value read is 0 and
> ieee80211_hdrlen() happens to return the same 24 bytes as a real beacon
> header, which masks the bug.  As soon as the skb is on a list the
> computed header length is garbage and the Group IE offset passed to the
> firmware is wrong.
> 
> Point hdr at skb_beacon->data instead.
> 
> Found by code inspection; not observed at runtime.
> Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
> Tested-by: Ping-Ke Shih <pkshih@realtek.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

3e303ccc30f2 wifi: rtw89: read the beacon header from the skb data

---
https://github.com/pkshih/rtw.git

