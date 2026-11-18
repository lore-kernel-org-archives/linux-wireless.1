Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025068;
	b=z9F9Z9d6E1I+o655tG2F/6OgMCRdVYA9sDwbJskxkEdL4cW25WH1DtZ9t7Rjrwn8kauB
	 pd0vhwAmVpj1fHiLmHu+xLjSwlTvtoVEldXIAQCBxDzqsRLab8nbsdcJKcI71PhMPt8t/
	 ynfxXALNejf1eoUAtzXsgr7LwSDuGqaiYUb9/Mo6MQucxnrD+WEIcNEdVb9mALW2CP9QL
	 bHG4FVWtbiGIm+KE+JD73Kb6gDVSdFbLPIFq9xFP3MDyHpEqGnFaoE1d7MAwoB+sqjfkv
	 HdJLpDH5RS/sZUVOPXLjYz89Lrqrarzv8z8y83CZMjJ+E9AmqkxypDx98f2n9BVxK1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025068;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=xF0SirUc1BJmbMaHtSwE7Rsug0l8562tqSmEk4JrSqU=;
	b=BpyE7ISew/Su8chgwnC0UQ7d9od9QBINpqX8lr1zkPkWMMPtmscg2Qf5yQ2lD+tDoWHx
	 GBKD4J0x1fsezcYf8UX8igHub9vswdWHPv328nE2IIFurBvgjXQB9gMmIEQYNI/NSW03x
	 YBZo1l5IPK0EW9hcb66vei8M4UFwjGROdFlXbubtO/W1Ugy2Ms3ScX3yL8ohJmvru8O+6
	 DyMy1q7ejbUT/iF0RQmfdemRg70YgGkMafLGPuD7fnsjJJgO5AQVatNQXpH0wBf+svueG
	 D1ecDTHhidtL5no23JMbROhEttk0Dh49Pf5C9oIui0mi87wq6jHDzvJk2X7ikVQimNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=t4PxUckr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69BC606A32A;
	Wed, 18 Nov 2026 18:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=t4PxUckr
ARC-Seal: i=1; a=rsa-sha256; t=1795025062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WSNX4FBzvbkaSG/XCc+ky7ByNeIuMva2tynHJ/oJLtuNBai0Yi6rxI1TA9REbRDRt4xkBgzqhNYii4PFhvNjPHXHdm38vHeO4TuDxCZx8szRcueMLS8nM1MazCCXg3CL6Bd328nqOhjSyL4oO26YKVxypJ9FG7hr55Gc4OKvRiE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795025062; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xF0SirUc1BJmbMaHtSwE7Rsug0l8562tqSmEk4JrSqU=; 
	b=VHV1uzMsNSO0yvEPMM7lyxPdE0aqdl3ngMUP5Lxu0Hlpac2I7o+K3Ia0nTcitL8w6ItmCtp/VZL0MknQ6wrKlmgtW7PnSS/nUS7OYVNFC35g4CStcrNhGbjkBOVjjtJRPc9ds2ATYn1q64HJCs3irh26XjBU/D+0RTojD9jOoyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=t4PxUckrdtdFmx32Ft/seCkiHKvCAFpj4u2NVJ0j0qzbwMRDLGykXY32tbFDsIwuXDRQ7AlU1UjfJbmJsxMwyVjuMHMyIP0G9naeIwvgpWQ9C8TzWtAS2UA6rbr3ARH8Igfh9TMPCJcbbMkX0nVM7fXcytBuPGI+7HrQmo5h6BRr4nBiqGJylOWP231xYNTErEwhHARuR33rZwjBlrGegI101okGzTkjtBWnJujH3mLvoPOtBIH3uzg4WPvVOm4Ujx17MB2QXYJesjJlLbC1cmw4MPtOpftOie8IT2PZnpEjqo6oJMK330IlnGqJBMIhtCgvVbzqHbyIZt7qEYvgNA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=xF0SirUc1BJmbMaHtSwE7Rsug0l8562tqSmEk4JrSqU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795025059685134.09528325705185;
	Wed, 18 Nov 2026 10:04:19 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Zong-Zhe Yang <kevin_yang@realtek.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v6 3/5] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Wed, 18 Nov 2026 23:04:14 +0500
Message-ID: <20261118180415.2022-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <92ec08f2829441c78c7b2265d931326a@realtek.com>
References: <20261117094135.1772-1-owner@ph4ntom-rev.uz> <20261117094135.1772-4-owner@ph4ntom-rev.uz> <92ec08f2829441c78c7b2265d931326a@realtek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Wed, Nov 18, 2026 at 06:30:01 +0000, Zong-Zhe Yang wrote:
> Additionally,
>     (changed & (IEEE80211_CONF_CHANGE_IDLE |
>               IEEE80211_CONF_CHANGE_MONITOR))
> seems to be true for any first iface (even if not a monitor) by
> ieee80211_hw_conf_init(). So, perhaps the condition should be
> 
>     If (!rtwdev->support_chanctx &&
>       changed & IEEE80211_CONF_CHANGE_IDLE &&
>       changed & IEEE80211_CONF_CHANGE_ MONITOR &&
>       !(hw->conf.flags & IEEE80211_CONF_IDLE) &&
>       hw->conf.flags & IEEE80211_CONF_MONITOR)

Good catch on ieee80211_hw_conf_init(). I will drop the local variable
and add the IEEE80211_CONF_MONITOR check in v7.

Thanks,
Enver
