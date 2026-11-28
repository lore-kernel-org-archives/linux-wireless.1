Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880629;
	b=RPitGciadFhm61Iyy7FWfPkAxFKtQq00VVt7XgZ4cKR9n3f0708dOtVS07ohI57ynXJZ
	 6yOPB8FFZddnvas2FwjCpMiou6daMbQddpnVeMdsaas7eT5O4Kfq3+WAIJhCZgW4lckXQ
	 tozKbZiaVRMOuSfmBCA9NieeyDv69NHc+pvAP0ygyJBR5JO88K1Pmq9QWqONF10eGuKzq
	 YYqQnI2X+G65hDBfecdnY5nQStTqiVXgHxPu0YT8hZnwiXPO6NOTNMFUFAPhZnOnRr5du
	 kErBkMhB6+GEIEQRe1E2kXLmlb7WfJlxN3axUiXQ0o0ge9GpinAB+tyxmJKZiTAYeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880629;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dv02N1+N6RqZ3fVMS2wY6eq7XIvcrFGSWaoNXKCmYBM=;
	b=i/z8vY4bUPJsIE1CDDgqXRWr+LZD0eMxshGyVqF4ci/gmKUiBXqcBKeVpYpMC8F8kWBI
	 fBbxFv+bACo3mbo8JZj81maF90/OEqxkFIwsN7TB1hk2IqkTKcz5VYlto7WGETVZzBbr8
	 XYPVuJqdpVWTIGHGk5u/q2PV0cTj8hcKN5NMySYHah9OuoQbwz7RukhM/BVCDyh0Upmsm
	 NNCCCzbdXXqkWoZL4qs8RnEfhmItiI6anZBRVEZ6az7Z2ADgEJPG1rsd5wGk0QgocXZft
	 b8scrGrTESB9UwBifZIc9MQo/VaC4jUOb8k8cObJdWHz67n2fzy+mf2pG3ydEer+MUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WWqmJtu7;
	arc=none smtp.remote-ip=95.215.58.152
Received: from mta1.migadu.com (out-152.mta1.migadu.com [95.215.58.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF40606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WWqmJtu7
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dv02N1+N6RqZ3fVMS2wY6eq7XIvcrFGSWaoNXKCmYBM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880626; v=1; x=1796485426;
 b=WWqmJtu7yDWVdnWmDyzhFCuRdoKp3fRLuFLJFbLy8mrz/fdB2a+qUxU5xTeb7zxzl1ZaKl7o
 BOfVSbmVpXxhz49WKTg+wDBap0mYlYtwU54ejeIOcGCf8u4k5hPhfa2MoX4p6UFiMVFLduGPqkV
 W03S5qy/dgqZyVwS46knh45k=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc3397ba78e546c9;
	Sat, 28 Nov 2026 15:43:46 +0000
X-Mizu-Trace-ID: bc3397ba78e546c9
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:43:41 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_2/7=5D_wifi=3A_rtw88=3A_skip_?=
 =?US-ASCII?Q?the_dynamic_CSI_rate_without_a_cfg=5Fcsi=5Frate_op?=
In-Reply-To: <20261127180034.1058591-3-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-3-hjf3108@gmail.com>
Message-ID: <CD5EDD5B-F130-44E0-B433-1B107464EB86@linux.dev>
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

On November 27, 2026 7:00:22 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>rtw_dynamic_csi_rate() runs from the watchdog for each vif that is a
>SU or MU beamformee. new_csi_rate_idx is only written by the
>cfg_csi_rate chip op, so on a chip without that op such as 88xxa,
>an uninitialized value is compared with cur_csi_rpt_rate.
>
>Return early when the chip has no cfg_csi_rate op.
>
>Suggested-by: Luka Gejak <luka.gejak@linux.dev>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
