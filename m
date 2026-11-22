Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795320046;
	b=Y6g+i+wvpLGtmTi0lKFE/v8q2+u31tstSDJyfG4VY+jX2RRSDWbFFEVIZ99WYeZNZnWM
	 T7eo43J5ng/Smlgq54eRln01H0tqlqSDzuz24geGIRZJgpG7E4eH91+wFfbA8xMVcHkGI
	 GF/nZZyKftLwwU6KuSn27CNFgfzyeaXzcVpPRvv/hjjzJQwIOuh841nXI6+rom4Xkwh1F
	 udR7IyVn1duUaGkJi+OS86g9qatcYE1XXXQxDxELTM6wsWjkPUVju9SiM2LwR85gfSlPs
	 +VAaJVDdA5/tdiCRvPwTl0Ec6I9KB94eqdJbMNLCmol36MXN8VgocabXtLG+pMfX7FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795320046;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=PdlNbyp9OoCYu3aDlgi4XHynmvr5+VbQ8qEaL7vS2Yw=;
	b=Mn4q2F/hhZMW688BkjU5JXFZnftLS47+8JSpu7ncxtXLDP+yvga3mhMeVRnA890qyhfF
	 HR7ZXP8cJWGC4sQnDH/l2nULic4OxT8TRbXhXM8qYIt6eM7gLn5nPpx0wquyS/HE+TGk1
	 jjmyy3dJpSSVCY+YQ0sMeu834tJZ2njTHRf/GlQTH4yk+sFmhbLGd12Q0uy1gJFNDmP2s
	 29Ct70THRCnoUpplbyA/k4TkCilkwOOkFtS+a0tm+vkqkZOHwHbFb2UA2oS09B2mSec07
	 uL7Fa1hp8Skq+2EBy2BVSvKfo6sprr4fzxzbuS6yTnKJ0lDdloyn9nW8CAy0HnOlccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uigVdpZJ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABEC606A32A;
	Sun, 22 Nov 2026 04:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABEC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=uigVdpZJ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM40MRK0549783, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795320022; bh=PdlNbyp9OoCYu3aDlgi4XHynmvr5+VbQ8qEaL7vS2Yw=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=uigVdpZJY7Hky0EF7UuNbPkDmMiQscAYhEUSEzA+o6bKuMXHFeLuWAELEd1Wtkwcp
	 L4bpxXdihdb1vKPVYLjPhYw1IunOD1EzPO5dLXrAK5XXRyN3Kinx6gRMd54MZuV7/2
	 4kMTbllRkGSboAP5OOPoA1Eu09oVp7gYkJuAAstyXWnm0/oRUM+rayAud23/LVdp0S
	 58VKweUeNGxnvLPyf3enoPaXzUczjaNOIrTY3MYjWdScarA8nEwfqW2J/lmbbz+iE+
	 0tv9TlsqeLziI8hGBsg3Mm7M3ickpBGfD7FIKH9rw9Izb3x787tpYcfWrcL026hjy2
	 GXcePSVNUEOtw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM40MRK0549783
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 12:00:22 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 12:00:23 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 12:00:23 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 12:00:23 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Luka Gejak <luka.gejak@linux.dev>, Po-Hao Huang <phhuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: find an associated station without allocating
In-Reply-To: <20261118104738.2020747-1-mehmet.fide@gmail.com>
References: <20261118104738.2020747-1-mehmet.fide@gmail.com>
Message-ID: <99284daa-7c2c-4b5b-a9e5-771b18334aec@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 12:00:23 +0800
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

Mehmet Fide <mehmet.fide@gmail.com> wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> rtw_core_check_sta_active() collects the interfaces with
> rtw_iterate_vifs(), which allocates an entry per interface with
> GFP_ATOMIC and skips the interface when that fails. A station skipped
> this way counts as not active: on BSS_CHANGED_BSSID and in
> rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
> saved for it, and a later hardware scan no longer goes back to that
> channel between the channels it scans.
> 
> Both callers hold the wiphy mutex. Walk the active interfaces with
> for_each_active_interface(), which does not allocate.
> 
> Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
> Reported-by: Luka Gejak <luka.gejak@linux.dev>
> Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev/
> Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

2edf54bca623 wifi: rtw88: find an associated station without allocating

---
https://github.com/pkshih/rtw.git

