Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795075375;
	b=L2BdxFGon+ZO6KpOawLDOj3A6r9mWbyHasxQcuDdl9WsKjF7LbjiamD5Byug8Q4vnAsO
	 I0OqqLpVv9mFe/eFK3FE+0LCExKRFHreCot8K2HtEyqXZe5u5dDIuCBQdqfhwyNDEgRlG
	 KliaBFkmfuTLdrkk7mlJK2JLgV94RtvzqZPhIpD7enjOMMr2xxQ5hNl+SmTVLkGT7XShy
	 LA5CmK3f0LNiR7Io5by1vdtwhZZz2HcrplhteJBV8Hcx8qHWnzaGHkJaX/7raaWFv+xuO
	 ZOzdgeu4V3YWsiBy9CRnC6Ie6RyDHFSwZYe261dmkwD7LkmcOdDFKH4cVWNHq1H8jKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075375;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=NQ08CP0DD+wtml1T87lEEAGAcD+7yS/KE4OyLjZbup8=;
	b=RArKyEG6MPF9+JYD7TfEhiCfvq598rsoqMKRuaa/7Jja3Sg/K0V3nyZZgDxq1vO7Hyt7
	 7dujv0vtfvSMrS/twnFBS8uX0p56RSmPCjJwe88h14zbxeOZjT2/yg1h/DxkExjB2i0Hq
	 ocCXAcGSvyLVJEuKcQurwtuZ1ub6O1aJ+X2Sig5wZ+JoPoxLQ09QzjlXF3eKI5t10FwWE
	 /fuCrjR8v5TfqY9gdtn3oGjVdHNhhTTkE0FnB8jI/bVHmvuW8mBT2W6We6EKRZCr6exQL
	 8/dL/2dfOSAEQDcNMQTl7HiCQT1f8k+r4oNH4MvXNLMt9eOa7fvwXsnPLc2QB7/BbIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=GlaWkj2b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FD606A320;
	Thu, 19 Nov 2026 08:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=GlaWkj2b
ARC-Seal: i=1; a=rsa-sha256; t=1795075372; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fojNhqR11BiXpxWjylcs2SPbVrWmzBX/LXJvB7cIu/aWWxwHXb5Vw2t4yAUPmsQCxi+EcA+pIBvwVsCrQ3sAKYqZe2A3x9sifSv0vcW2jDiVStzEX63hmhsQ0plvXB1czHEQQNrF5LdbEOVWavrvtN8pA9CNKIhNP9Wy/XTadzM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795075372; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NQ08CP0DD+wtml1T87lEEAGAcD+7yS/KE4OyLjZbup8=; 
	b=BWsYvmMg33xYa4U3XqfXdKBAd392BDD45/fZx1zIgYZWZbbYAbt9DdqrFDayMlzynoPI7cScv2cNrBCSk93Te/h0iC+IKlR9IzCIxh4TYoesJQ4d8zFQqJnUe4YbGVQBGGvTPrmWgzHJvx2FCI68CJGxaxhKOOKtC25yOI5P9nA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=GlaWkj2beiwolgkVs2seMXVj93TPb1xXo1PgP2eE8pw1usNcgXaE1LnBBk/6uVhtsVcHPxgbZLw9n0y3bMMH1AcVf3gs4+aDWyNd8Vw7u0xuFTCxfC7WuhxYPiNzmsTET/LnGIJ9JOxidX/ukCKBREU4h4tQPN2FcBAnmzgT+Dhxwh+Kw81KnblBdK4KSDr0DBU7dQnz9glszltrXeefj5qNRemJGW5qIXbvbnXM5jiACmXEfq8TFBc9UqhDo63hpiporPxgxnuhmjv+wuuyEb6gZkJmLuSreDf6Z99rC7/UHkt6h96CSpf/0Ry+4esuUrdrdwnLXxgn0ts7ICCMww==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=NQ08CP0DD+wtml1T87lEEAGAcD+7yS/KE4OyLjZbup8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795075369229121.35959973513354;
	Thu, 19 Nov 2026 00:02:49 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v7 5/5] wifi: rtw89: honor ASSIGN_SEQ, retries, and NO_ACK for injected frames
Date: Thu, 19 Nov 2026 13:02:44 +0500
Message-ID: <20261119080245.804-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <10ecdda16085441c9eb930bc88c79c6b@realtek.com>
References: <20261118180435.904-1-owner@ph4ntom-rev.uz> <20261118180435.904-6-owner@ph4ntom-rev.uz> <10ecdda16085441c9eb930bc88c79c6b@realtek.com>
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

On Thu, Nov 19, 2026 at 07:27:53 +0000, Ping-Ke Shih wrote:
> Since RTL8852AE doesn't have NO_ACK in TX descriptor, so please note this
> in commit message.
>
> > @@ -1800,7 +1814,9 @@ static __le32 rtw89_build_txwd_body5_v2(struct rtw89_tx_desc_info *desc_info)
> >
> >  static __le32 rtw89_build_txwd_body6_v2(struct rtw89_tx_desc_info *desc_info)
> >  {
> > -       u32 dword = FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR, desc_info->upd_wlan_hdr);
> > +       u32 dword = FIELD_PREP(BE_TXD_BODY6_NO_ACK, desc_info->no_ack) |
> > +                   FIELD_PREP(BE_TXD_BODY6_UPD_WLAN_HDR,
> > +                              desc_info->upd_wlan_hdr);
>
> Just straighten as original (a little over 80 characters).

Thanks for reviewing the series! I will note the missing TX descriptor
NO_ACK field on Wi-Fi 6 chips such as RTL8852AE in the commit message,
unwrap rtw89_build_txwd_body6_v2(), and fold in the Fixes tag and blank
line on patches 1 and 4 in v8.

Thanks,
Enver
