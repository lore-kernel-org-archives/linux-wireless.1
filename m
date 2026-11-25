Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595872;
	b=SVOcF58Ag5dwJAo9qxwcAOyvx2b5dcsvvau4FDF/ylgw9o2wL4htgZKi7eS779Os9G6Q
	 zaeO608mfn8I5T1UjcxssETSfo6fCQtqoFzJdIBJ2F6pEhDLuo9HKd8NCI12u07Vn2zWJ
	 D8KuIMdiHiT7gRnaZDaPa0HfJ9xVMdYouMtT1JUPrSlElyHz2jiGJ7DLkmu9Q1k2M+ZJT
	 qxUJ2NXhc3mUaE2ipJGPilMEnfzk0SjC6V59uvT5ZCNZ6m6dscY+PkIHo75jf/zPT2KQ3
	 Tk4UcAzh/wQCyWuSmnd8HQf1ixzufvQLfzKxN/9EewR8dZFaDtzIUleqxkQ97DXxjIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QahsvCSi15PeS75E448TMRSNspXuBJunz46leJWEnQs=;
	b=WifBwD7dePBqDTMJAqA60J3m4L+mDzGusqxyKDKM0dqjBEU7WppCLL2ONezx4GbEH9a5
	 347V6IYrwrhiDooh3UzIVPXEyZr60UvUnxKdk1Fcqg1473JplwAtpNpmo9pqOmMWDtPOX
	 yZAY81OqEZPpb8/w10MLVvuR7t3i9cLqsvSCEw2Yg8y/naPH30FY7d2rfDuLViDSKYMK4
	 IvB7h67WYY5I0eHu40q6WyeTm0rlY8rq2r6/iFDhwA06nEwMis9hlqsn/9t7IWqtafrGL
	 mJex1a0/Jc6yDyQpmtGkMblNomd+ggqnc70bqiD9/QTho5qd9ie+Vc8M1MNbIFcsSRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I82PPhtQ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2432606A331
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 08:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2432606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I82PPhtQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38692f62b22so6110554eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 00:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595871; x=1796200671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QahsvCSi15PeS75E448TMRSNspXuBJunz46leJWEnQs=;
        b=I82PPhtQe+oOBdHIu9dz5gE0qUlkNdz+pI6QZOAE9K9DTY40MKwnL1xYtBciRLjL1x
         AnB6d6Sw0ES6r1lvsOiTc7Y60yu3rK1zIhUD0f4hIEBK28dATqKrJ4IArqI496MTqxb1
         rX6Pa6FatjfLIf3ue3c8KV82HBMXBSmPsVKipif2qIOvR+p0enf6sG8/g2z1CVWOX7Za
         EHP9tbg+X1PL0S+tfxH7eS5ykL2hImSMli9mnuKbmMQSL3rvlG9ZtTsCvnKUv2gIZYUR
         skt4p+tihqqn5jyyaRrmyCwGRxOeVtBsevAapGspwiNibfP6kO8K364frVI5ErDtBCWt
         ZKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595871; x=1796200671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QahsvCSi15PeS75E448TMRSNspXuBJunz46leJWEnQs=;
        b=oQixnWh4bGTrOpkRy/jt/TE5uWeP0c8185uPoRQhprVFNbGkSDPwq6GOQN3nC1NZCP
         Kc6vCqkPJtZ6yyN/MQBGscXV1CmQDbZWujt5ttUDWRcr59fC0PRJn+gljeLL8KMXZsM7
         D0HsReXYrxeSO13fzz1NXpzChFvBAaPQbJX8a0Audf3NeBfRA/eHvQTEqdAD68e7cxd2
         lLB20lkI0YUXAq+BPYDDqc718NuryleOVZFzTHxjbrxp+DOxqA3p+LevSC6SC6ZbL38A
         cX6+h4EMZyl344RngrGo/czEJTsF0ztrrcbGjoa3rLwD4RDp1wQC56a84ov4WkbU6rJU
         J+dA==
X-Gm-Message-State: APuU4Z+MHJxcDzmwAd0cJg1PmnAMrAGw6dQD6mNjblJLH9UrtnFw3m1g
	ne9NPhN4xj5jDt+tE2O5OQfA09a0EUbZkMCVT3e/bJV9fNagZy6LFunYlzx2dw==
X-Gm-Gg: AZFdTZfTqSxjAguGm0xVXbbg3MgJXFIw78bvF6o9IyNdTJMgYGxeCy4k3LUSptICPQg
	UJ857fhjXy5Dy+fwuxXyixMo8PMt0bHMvHul52dghWvJeuF9JhsG9bZSDaq5Dax/vMSyXycIMcw
	3gf30QYUYlFFDhZR4bWyh2pMRZulRIrh7ZQ5pXC8wKOogc1pIARuJImBSAvPW7364QdkQABBdQ0
	k8MJ63Dmy51XuUEkNacu+tu2fzEsEY3ZEus8zpjn+YgvigIAYnIqSW4Zf6yMkSwFP+uaZsf5aKj
	7Y9AiUmKyD2+rTH/Fqha9M4VNoGPYpY/yBWy+ypGwaOVjRUSsxnfXW9BPJSLn052tlWYXrFVtiX
	6e8CnF8qgGo892KImUO4hboUrds/tTbFooD2RE5MVFvjVKtqYoH0lPsLTq9o5yOymfVKyPNwEKM
	L96OkGoxgznSCN3dpTef5yl897UkS+u17E0qVNX1qqNR6oDXUoryomCaxgwAu+VvkgcQC2PCwoN
	SWKFQaH06sI1lfPL7fSjv8MXXw5yvEhBlaKzWYGZtF7lcMPWqKpiQ3cbvtaLA3SgMg4w141D4Rw
	7lvV4YQsCa7+N+qMsbyt0Ujh94KP4a0auqbm2e8Iwb+80C7bNTWTdsix8O6c7cCQ9mszfK5CsvQ
	=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr18671667eec.9.1795595871066;
        Wed, 25 Nov 2026 00:37:51 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm43927422eec.19.2026.11.25.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:37:50 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 3/4] wifi: iwlwifi: mld: validate BAID in the RX timestamp update
Date: Wed, 25 Nov 2026 16:37:41 +0800
Message-Id: <20261125083742.1355074-4-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
References: <20261125083742.1355074-1-maoyixie.tju@gmail.com>
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

iwl_mld_update_last_rx_timestamp() indexes mld->fw_id_to_ba[] with the
7-bit BAID from the MPDU descriptor, before iwl_mld_reorder() checks
it. A BAID from 32 to 126 reads past the array.

Add the same check here.

Found with a CodeQL-based static analysis tool.
Reproduced in a userspace harness under AddressSanitizer and UBSan.
Not tested on hardware.

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/intel/iwlwifi/mld/rx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/rx.c b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
index e1964e570012..af0373d5e693 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
@@ -2311,6 +2311,10 @@ static void iwl_mld_update_last_rx_timestamp(struct iwl_mld *mld, u8 baid)
 	unsigned long timeout;
 	struct iwl_mld_baid_data *ba_data;
 
+	if (IWL_FW_CHECK(mld, baid >= ARRAY_SIZE(mld->fw_id_to_ba),
+			 "Got out-of-range BAID %u\n", baid))
+		return;
+
 	ba_data = rcu_dereference(mld->fw_id_to_ba[baid]);
 	if (!ba_data) {
 		IWL_DEBUG_HT(mld, "BAID %d not found in map\n", baid);
-- 
2.34.1

