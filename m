Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753400;
	b=Li9KTlpvMPmYGB4/uVVBfrgp+bAFZePlcaP/fTSyDiwDsU4wbvKLmEmicJOkUZEPZJ2w
	 rjl4/oLTy2vN6ECcLVZM+bg7udZ34yQX0X8VJK98wUcBQqdpeXZtqgG8Q3vs6HIlyP0OM
	 213B73mHWSZGEyCJ6aLUtWM9nb2bgFKEjlzd7kF0EZe02dTxrxrzwG1z3bwJUI4tazDZx
	 hGLMZk8aFsmXngXR324qC2l+MndQ8NndFBoVAz4rqGasLwG9P90bnmvs+Z8EJJ7ysSpuK
	 wcqFtBS0JYD7FEaAo5U4nKJJWhNcMNyT2uvUVMB9+RIbaaQ8yrM9Jbd4dzqpRHC7kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753400;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:Date:MIME-Version:Content-Type;
	bh=3yDp7sejNgm+YCMXf2xL+zuF1uxBtOzcdcY1lePDmbM=;
	b=QxwZgkZN34W5mNvxDeIGlmZDbaLbbIZzIiJ7D0VHYJr7c2BKjfRRJLdpregJNN+SnvYp
	 xIHnE6wMpe9YILcBs8RufPSjbzSHUr4JDVrruwZmPXNZEYdFcJm1BAxNl8pvqKowbGegn
	 YnaqBiekbLCf62CyTjd6bYrterZF5X/kpItqo514S1+ULTPwiJP3YXdoAZLvAvoWkVLep
	 ya+qyrTD4mRWUfXK5vwGGl/GqYJIa0WG5hEEcJUhN/T/TcrLRKuj9PL5cOuL7jUQE7k29
	 /9WrRSO+JxXk4+eu91cWrM3hF5QilsDEXigwxHonF1hyocMgAz3ZL9qw6B5oCsSdyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=VtYvidyb;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D786606A31C;
	Fri, 27 Nov 2026 04:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D786606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=VtYvidyb
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR4N8LD0632151, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795753389; bh=3yDp7sejNgm+YCMXf2xL+zuF1uxBtOzcdcY1lePDmbM=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=VtYvidyb6WRYryFlhrV0z6yZYc/7gmM6vEMwiSVPaI+0z8udohJwIO9xZ1jOanCrs
	 1KJnayA5gbu/tSKe/KcLwuDkO9CcW8kPKeyOJ+Mw0vuyFNg1smqCM3XkbTkHedLzWl
	 lehn0Rbb1w4tViKxpPOwM1dbBSivpTXVRn9Q+NMBkuPHmvqtu/5yVQbydLNCTXHzKO
	 N6zSBvs5Sjblk2MPcqXFnmpy8WFYY5bkh2n8B4O7aua2jMzLyrj7Xxw6uG9uK2nazO
	 37QAsL5RqqJ6mUdHb9C2bRJx0Z5CaSlioxxEu7tS0fXsGPNGHwnZERavrjC3Cbmn/8
	 UDg6zel7eZQyg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR4N8LD0632151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 12:23:08 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 12:23:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 12:23:08 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 27 Nov 2026 12:23:03 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Nicolas Schier <n.schier@fritz.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Florian
 Held" <f.held@fritz.com>, Robert Sperling <r.sperling@fritz.com>, "Nicolas
 Schier" <n.schier@fritz.com>
Subject: Re: [PATCH] wifi: rtw89: Add support for FRITZ!WLAN Stick 6700
In-Reply-To: <20261124-add-device-ids-for-fritz-wlan-6700-v1-1-f1a23c5df0fc@fritz.com>
References: <20261124-add-device-ids-for-fritz-wlan-6700-v1-1-f1a23c5df0fc@fritz.com>
Message-ID: <73fafa54-8c0c-4cc3-af7b-f9581059e3b8@RTKEXHMBS05.realtek.com.tw>
Date: Fri, 27 Nov 2026 12:23:03 +0800
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

Nicolas Schier <n.schier@fritz.com> wrote:

> Add device ID for FRITZ!WLAN Stick 6700 USB-A adapter.
> Originally added and tested via [1].
> 
> Suggested-by: Robert Sperling <r.sperling@fritz.com>
> Link: https://github.com/morrownr/rtw89/pull/100 # [1]
> Reviewed-by: Florian Held <f.held@fritz.com>
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

03cd5746b026 wifi: rtw89: 8922au: Add support for FRITZ!WLAN Stick 6700

---
https://github.com/pkshih/rtw.git

