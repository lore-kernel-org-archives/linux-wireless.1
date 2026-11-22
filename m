Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318755;
	b=2bSwABZL9g1wyC3h329/hza0vSR3XCM+taWwoAsn0868pVYlplnv6/PJIkurATZKAo9O
	 ap8nSO2qZxB/cVeKu/Q/Sl7HFPG1W1LLPPEGeb5QvdPPZpPVaAwiZCsOwxL9jMF3xI6m0
	 ZQeKi65nTTkQBKutiXXHlu1mNP0IMLe5j/gjDwXdgjNBXPUpNPN2bvrLG63K0slPrfdYx
	 P95EU/meq+Ub/M4neWNHiHINQc5cwAdoerQ80Jm0PRZW69JoZZ2Aoq4z6/vnuxtaLWUxU
	 WCSE7vvui1/yW4LS1WQeal+PXCs+bXE2xay2XlrWDgCN3Nxzumm/nsehIDIuzlzvmEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318755;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=HEYcFEWeFsdkgLqj3xWRe/mK38G0Up7q46zxa/fcKfI=;
	b=O+bxesrOO5IyT9/4dVTCE75O9eFNvCrEtwTVrhOS+Ae861/GnonOreqZ7vXVbo31XC7y
	 rn3JvcTmBcX3Ccakcv4OiCoKpxUwsE/u5wcMMRL+Wz0e1ZD7kWiKBJ1/YuOlw6hF78PQC
	 a/VZU1UpBjnwVjhDILclELhSZjmNb5lwojwxFO1EgEXAhVe2rl/Heeoelx4Ka4oS1JyOO
	 0bPOpL3WeUxiTCj7GLDrc7XSnAbSU9KRM362EnDv+xaClyRntJ+Ou+pIzJJDw+UyV1yY5
	 Tb0RSTQWewzRyydViDb+0T2cXGnffW3gICpMbc2/+kOfXkg8Up7ko3/kjhnya/jcpRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Lq9e3LKx;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20737606A320;
	Sun, 22 Nov 2026 03:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20737606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Lq9e3LKx
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM3d98c9543774, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795318749; bh=HEYcFEWeFsdkgLqj3xWRe/mK38G0Up7q46zxa/fcKfI=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=Lq9e3LKxMJuPNlKCmrBaqE2PYYk/r4uChVq9tNNP2S+eKyR428eaUVwXcmwlylaWG
	 YzojgJ2ZyLLAOpm8y+AwOy7BwNQQaXISk1H0QbEtseB4duWts6+4XVTO/JWyF8pOAT
	 HrkCT2aDMmbWinl1ZUv+193QFGaUuLYnTBRybDt1466IaDiBbXc+OBWheMZ3dUPRix
	 fYpzjZf+Yt07GHIZFkUOQpXeptRaBmcZJQiNDZ6T/samxFMie72mDFFzZWNPAzqhkx
	 6UsqYmjULAf5XzCxO68kc3gS6UTWEbA21NMMAqFan/jlBsjpTmYXRFwLOiQbbG6hPQ
	 MLxBJuYkNf7Jg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM3d98c9543774
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 11:39:09 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 11:39:08 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 11:39:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
In-Reply-To: <20260710030055.57438-1-abhishektamboli9@gmail.com>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
Message-ID: <1e060d68-141b-4246-aba0-9558d64d6ae0@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 11:39:08 +0800
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

Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:

> Add the ID 2c4e:0124 to the rtw_8852au_id_table to
> support the Mercusys MA72XH usb adapter.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221738
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

ca84bddd1fe1 wifi: rtw89: 8852au: Add support for Mercusys MA72XH

---
https://github.com/pkshih/rtw.git

