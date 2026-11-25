Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647335;
	b=4pvdQkyd2vj9FMaFeaXmS901ORHhIz0lPtIDHoo88UIC/BYjf9+GnVrqHL7C8X4cLYzQ
	 aFpOg3qJeUWUYyMZihpnuSRMSNmOhnt6IEO2MLx1t70trNUrO0K9RQGmqnWbmqJQA9prz
	 IUxMeqCgRhLy+IRQLTd2+EW2WiAATxz/fQULb5O0BqikPHH09/0feSrR77QVhirRCc7vh
	 wIku4NdNylaX8fSO2qZgK6a2tdVoM4s1GEebjzCYMV3LmE3aEvtqy0FeW0RU32XuyOTEB
	 uFktOtCdsZC6iNnEsd9Nm2omnGUI4NpH0HDyrowuaMlKu7cZSfczzk93NG2RSjLcdXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647335;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cfXZ14QND3WjKYNC9UCJvXr/veM+vkfDQNZABOALCP4=;
	b=vQ2M2WdQL/6WBOvHXQTINMN8of1zPs59Sbqis2ZJBonFq3SulSBLTHVOQfkG0XnSCEQx
	 fQ6eHMZh3Doj4UuOhG8mr8bh0olY2a/qLw9d+RpzbN9rS0DA2dtZnj0xx1odo1X9V6fNd
	 W6K90J3zdEoDuti4oL6OvHQwOhR9bS60OGkCcTIhou4h1UYMS+5vAaOdd8CrQAKUM218N
	 /JBGNkUWYwKIgMX/lC9udpOc+14ThWILgzOkTSm+raPhLwEQkM5P35bIBX5CwG2v48leg
	 BUdK0DcRO6ZX7DiXWuHoZ3/48NbOOAntiN2cgIzyk6KR81gkDz+Rrh+TPLtpJdreiCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZewApkt;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF455606A682
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 22:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF455606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZewApkt
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cfXZ14QND3WjKYNC9UCJvXr/veM+vkfDQNZABOALCP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795647331; v=1; x=1796252131;
 b=OZewApktVGQUTwCdmYtwhiqHIQQxTPkeeLYEgkgzFF9WJ9RYbU1WWLgU4mxj8y5FVWTa0kjw
 ZuRxDQKEtYteFYzGYkBqQ23tkApf+40A7FVPbtryjXo5a49UaH+U4tPInnNJ7tYFedwIX/jNzko
 Hukq217Ch0r40wyeH6Lhnlpg=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b2ba880aa252d78;
	Wed, 25 Nov 2026 22:55:25 +0000
X-Mizu-Trace-ID: 1b2ba880aa252d78
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 23:55:20 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ahmet Zeren <niko3x@proton.me>
CC: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_1/2=5D_wifi=3A_rtw88=3A_use?=
 =?US-ASCII?Q?_the_rate=2C_bandwidth_and_GI_of_injected_frames?=
In-Reply-To: <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me> <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev> <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me>
Message-ID: <28ED0B12-9712-45BA-BF90-8D7392C5D504@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 25, 2026 11:34:49 PM GMT+01:00, Ahmet Zeren <niko3x@proton.me>
wrote:
>
>Hi Luka,
>
>Thanks for looking at it.
>
>> Do we also need DATA_SC when the requested width is narrower than the
>> channel?
>
>You may be right, I'm not sure. rtw_set_channel_mac() writes
>REG_DATA_SC on every channel change, with the 20 MHz primary and on an
>80 MHz channel, the 40 MHz half that contains the primary; and the
>normal rtw88 TX paths leave DATA_SC at zero. My guess is that the MAC
>uses that register then, but I can't tell whether that still holds
>with USE_RATE set without hardware.
>
>If you can run that test (a 40 MHz frame on an 80 MHz channel, with the
>primary channel in each half), that would settle it. If it goes out on
>the wrong half I'll add DATA_SC to the descriptor.
>

I will test it in the morning and let you know the results. I would hold
off v2 until then.

Best regards,
Luka Gejak
