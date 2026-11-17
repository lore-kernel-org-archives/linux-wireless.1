Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900678;
	b=jjCooOMuGXGIidmPu5B3sAVAXRKjySQ6y75JgA78G5vfvMecPOFRDD8hl5yBLnRKAMLt
	 KyzYkxn6iduNXs93jSDenHZuseFp80xuBFD19Yb9Q+vKA2tUyJjGwMudRDJeMMqbzxcEB
	 6byYtMAn2/i6apyxCikXhoD/ovMuB03cvnp2TiHPXhlfvHmQEYBpEUV6RdCzoMSBsuk1U
	 ZOn7SPbOUoaAv+oR00R3wepmHtY3+IRQOzw3ljnpEdPlY0gpey4CfDcZZDLDoYgezY0IL
	 LH79ArCB4aCoTo09mImgYJWYKf5nhWKC7AaTjhpeNBMIzWLK9Wq+XtyCmcwL2I0zOIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900678;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=2NCaHb7V9i+h1hiUu+i++Ep7PuCN36ddPB8quleqqD0=;
	b=D20siR4GrqLALnDNkW0bgHIRqeFf9Yx6V6xRhc8OdRHIpxbwgRlkksoflT3bvVLmjgGn
	 HInft6uxY29EPMUpPLDHeH5rg86oGhBeAieo2SmCB3GfsFYw312CRT+t5PpRpfh8EaUnM
	 88pidDF0RaorQ/n9fFklecWfDDTRqfloTf4BQTQqjvsdvorCgBw4+8CbUkdsDGN+I+Meu
	 4fDIFI1wJe5Svax3jfz6yuaxb/+Fa1iT5OAEzW5yC/xC10XgY7zjBAbwP+V6Ov0KpZe8b
	 A/DJTr7ff5FZMpy5MfQ9QRmXtjByQYn0SSgqAvWuWZ+fR08Xjs4HzxTaHf5eKfYlL5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Z3g4Jod1;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4812606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4812606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Z3g4Jod1
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AH7VEulC047273, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794900674; bh=2NCaHb7V9i+h1hiUu+i++Ep7PuCN36ddPB8quleqqD0=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=Z3g4Jod18cqFIr+VQ99w5RwUYeea9Y4KN4mCTILpWLQNobD4RbasU+3Y0DVo9P3Yx
	 MNBkLfTNHgMy3Cgm11sZEcN4Pl1gUKAAK/qIhrDS4LuJ1eC5n9qRT/le9lliFe184A
	 lr+TRXt3BVZG4MlluUDtcig43OTNFjwc3TZiV/8t2LIA37LV1ChQkhAUnhaDN/u68z
	 ldvkGEAGMSaMrysdLfhOBTcoZNTSIggpmo3Vo4Acpj9fo8MeQlBswvYHAbmgqVk9vV
	 9KbtCRggna8Co+GMxyE1Qui3LHMxFG+FBhYYha+m2GYuWvUkdyKGCrZ5S2PbwKzsnm
	 4EDiwiIVd0iZg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AH7VEulC047273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 15:31:14 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:31:14 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 15:31:13 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 15:31:13 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Hao Tan <guwolf@guwolf.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtw89: coex: Disable pre-AGC for out-of-band links
In-Reply-To: <E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com>
References: <0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com> <340ed206ff6a4680a46806e3bea5dbc5@realtek.com> <06F216C4AE1262C6+179429243268.102150.10348649522717765093@guwolf.com>  <E6568F470624C07E+179429427543.116514.14355630958613033614@guwolf.com>
Message-ID: <fd863ef2-8bb3-44e6-ab5b-27f9ef0d1c4a@RTKEXHMBS06.realtek.com.tw>
Date: Tue, 17 Nov 2026 15:31:13 +0800
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

Hao Tan <guwolf@guwolf.com> wrote:

> When Wi-Fi and Bluetooth are on different RF bands, neither the TDD nor
> the FDD binding has a band. _update_coex_bind() records that as
> dm->out_of_band.
> 
> _set_wl_preagc_ctrl() disables pre-AGC when the TDD binding is 5 GHz, or
> when the role is still NOLINK. After commit a76501e1d148 ("wifi: rtw89:
> coex: Separate _ntfy_role_info into two function"), a 5 GHz-only STA is
> no longer NOLINK. With Wi-Fi on 5 GHz and Bluetooth on 2.4 GHz, tdd_bind
> is empty, so pre-AGC stays enabled. On RTL8851B this programs the
> pre-AGC table, and a VHT80 link drops shortly after association.
> 
> Also disable pre-AGC when dm->out_of_band is set. Overlapping TDD and
> FDD bindings are unchanged.
> 
> Tested on RTL8851BE (RFE 5, rtw8851b_fw-1.bin 0.29.41.5) with 5 GHz
> Wi-Fi and 2.4 GHz Bluetooth. With this change, VHT80 stayed up for 600
> seconds on v7.3 and on rtw-next 04c998418722. Without it, v7.3 drops the
> link shortly after association.
> 
> Fixes: a76501e1d148 ("wifi: rtw89: coex: Separate _ntfy_role_info into two function")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/linux-wireless/340ed206ff6a4680a46806e3bea5dbc5@realtek.com/
> Signed-off-by: Hao Tan <guwolf@guwolf.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw branch of rtw.git, thanks.

685dc94d51ca wifi: rtw89: coex: Disable pre-AGC for out-of-band links

---
https://github.com/pkshih/rtw.git

